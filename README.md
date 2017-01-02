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
Test Suite 'All tests' started at 2017-01-02 13:56:22.586
Test Suite 'MasterMindPackageTests.xctest' started at 2017-01-02 13:56:22.587
Test Suite 'CodeTests' started at 2017-01-02 13:56:22.587
Test Case '-[MasterMindTests.CodeTests testDescription]' started.
Test Case '-[MasterMindTests.CodeTests testDescription]' passed (0.003 seconds).
Test Case '-[MasterMindTests.CodeTests testEqualCodes]' started.
Test Case '-[MasterMindTests.CodeTests testEqualCodes]' passed (0.001 seconds).
Test Case '-[MasterMindTests.CodeTests testInvalidComparisonBoundaries]' started.
Test Case '-[MasterMindTests.CodeTests testInvalidComparisonBoundaries]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testNotEqualCodes]' started.
Test Case '-[MasterMindTests.CodeTests testNotEqualCodes]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testTooFewParts]' started.
Test Case '-[MasterMindTests.CodeTests testTooFewParts]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testTooManyParts]' started.
Test Case '-[MasterMindTests.CodeTests testTooManyParts]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testValidComparisonBoundaries]' started.
Test Case '-[MasterMindTests.CodeTests testValidComparisonBoundaries]' passed (0.000 seconds).
Test Suite 'CodeTests' passed at 2017-01-02 13:56:22.591.
	 Executed 7 tests, with 0 failures (0 unexpected) in 0.004 (0.004) seconds
Test Suite 'MasterMindPackageTests.xctest' passed at 2017-01-02 13:56:22.592.
	 Executed 7 tests, with 0 failures (0 unexpected) in 0.004 (0.005) seconds
Test Suite 'All tests' passed at 2017-01-02 13:56:22.592.
	 Executed 7 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds
```
