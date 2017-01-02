# MasterMind

A small project to dive into the Swift programming language.    
Christophe VG (<contact@christophe.vg>)  
[https://github.com/christophevg/mastermind](https://github.com/christophevg/mastermind)

```bash
$ make
Compile Swift Module 'MasterMind' (2 sources)
Linking ./.build/debug/MasterMind
Code(Red, Green, Blue, Orange)

$ make
Code(Blue, Pink, White, Red)

$ make test
Compile Swift Module 'MasterMindTests' (1 sources)
Linking ./.build/debug/MasterMindPackageTests.xctest/Contents/MacOS/MasterMindPackageTests
Test Suite 'All tests' started at 2017-01-02 12:34:44.151
Test Suite 'MasterMindPackageTests.xctest' started at 2017-01-02 12:34:44.153
Test Suite 'CodeTests' started at 2017-01-02 12:34:44.153
Test Case '-[MasterMindTests.CodeTests testDescription]' started.
Test Case '-[MasterMindTests.CodeTests testDescription]' passed (0.002 seconds).
Test Case '-[MasterMindTests.CodeTests testTooFewParts]' started.
Test Case '-[MasterMindTests.CodeTests testTooFewParts]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testTooManyParts]' started.
Test Case '-[MasterMindTests.CodeTests testTooManyParts]' passed (0.000 seconds).
Test Suite 'CodeTests' passed at 2017-01-02 12:34:44.155.
	 Executed 3 tests, with 0 failures (0 unexpected) in 0.002 (0.002) seconds
Test Suite 'MasterMindPackageTests.xctest' passed at 2017-01-02 12:34:44.155.
	 Executed 3 tests, with 0 failures (0 unexpected) in 0.002 (0.002) seconds
Test Suite 'All tests' passed at 2017-01-02 12:34:44.155.
	 Executed 3 tests, with 0 failures (0 unexpected) in 0.002 (0.004) seconds
```
