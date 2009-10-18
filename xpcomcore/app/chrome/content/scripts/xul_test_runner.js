XPCOMCore({scope: this});

function XULTestRunner(argv, outputWindow) {
  this.options = {};
  this.argv = argv.concat([]);
  this.outputWindow = outputWindow;
  // FIXME - CurWorkD is busted because we get called from LaunchServices on a Mac, I guess.
  // so use whatever ENV['PWD'] happens to be instead.
  this.curDir = new XPCBuiltins.nsILocalFile($ENV.get('PWD'));
}

// TODO - add real at exit hooks into XPCOMCore
XULTestRunner.atExit = function() {};

// TODO - add some kind of optionparser class to
// XPCOMCore and also figure out why I'm getting
// -foreground in argv.
// TODO - when XPCOMCore gets a Shell object, just
// use glob and allow for specifying a test pattern
// rather than a test file or a test dir
// TODO - also this falls all over itself when handling
// absolute vs. relative paths. wee.
XULTestRunner.prototype = {
  testFileMatcher: /_test\.js$/,
  
  run: function() {
    this._parseArgv();
    this._loadTests();
  },
  
  _loadTests: function() {
    this._checkOptions();
    this._addLibs();
    this._requireTests();
  },
  
  _addLibs: function() {
    if (!this.options.testLibs) { return true; }
    var libDir = this.curDir.clone();
    libDir.QueryInterface($Ci.nsILocalFile);
    libDir.appendRelativePath(this.options.testLibs);
    $LOAD_PATH.push(libDir.path);
  },

  _requireTests: function() {
    var testFiles = this._collectTestFiles();
    puts("Requiring tests: " + testFiles);
    testFiles.forEach(function(filePath) {
      load(filePath);
    });
    XULTestRunner.atExit();
  },
  
  _collectTestFiles: function() {
    if (this.options.testFile) {
      var testFile = this.curDir.clone();
      testFile.QueryInterface($Ci.nsILocalFile);
      testFile.appendRelativePath(this.options.testFile);
      return [testFile];
    } else {
      var rootDir = this.curDir.clone();
      rootDir.QueryInterface($Ci.nsILocalFile);
      rootDir.appendRelativePath(this.options.testDir);
      return this._findTestsFromDir(rootDir);
    }
  },
  
  _findTestsFromDir: function(rootDir) {
    var testFiles = [];
    var entries = rootDir.directoryEntries;
    while (entries.hasMoreElements()) {
      var entry = entries.getNext().QueryInterface($Ci.nsIFile);
      if (entry.isDirectory()) {
        testFiles = testFiles.concat(this._findTestsFromDir(entry));
      } else if (this.testFileMatcher.test(entry.path)) {
        testFiles.push(entry.path);
      }
    }
    return testFiles;
  },
  
  _checkOptions: function() {
    if (this.options.testDir && this.options.testFile) {
      throw("Only one of -testDir or -testFile may be specified.");
    } else if (!this.options.testDir && !this.options.testFile) {
      throw("-testDir or -testFile must be specified.");
    } 
  },
  
  // TODO - refactor this shitty while/switch loop
  _parseArgv: function() {
    var arg = null;
    while (arg = this.argv.shift()) {
      switch (arg) 
      {
      case "-testDir":
        this.options.testDir = this.argv.shift();
        break;
      case "-testFile":
        this.options.testFile = this.argv.shift();
        break;
      case "-testLibs":
        this.options.testLibs = this.argv.shift();
        break;
      default:
        puts("Got unknown argument: " + arg);
      }
    } // while
  }
}