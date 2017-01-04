# MasterMind

A small project to dive into the Swift programming language.    
Christophe VG (<contact@christophe.vg>)  
[https://github.com/christophevg/mastermind](https://github.com/christophevg/mastermind)

## Running the solver...
```bash
$ time make
Compile Swift Module 'MasterMind' (2 sources)
Linking ./.build/debug/MasterMind
+++ The code to crack is Code(Orange, Yellow, Pink, Orange)
>>> guess 1 Code(Blue, White, Red, Green)
    result CodeComparison(correct: 0, misplaced: 0)
>>> only keeping with  CodeComparison(correct: 0, misplaced: 0) for Code(Blue, White, Red, Green)
    256 remaining
>>> selecting best next guess
    0 Code(Yellow, Yellow, Yellow, Yellow) eliminates at least 148
    1 Code(Yellow, Yellow, Yellow, Orange) eliminates at least 205
    6 Code(Yellow, Yellow, Orange, Pink) eliminates at least 210
>>> guess 2 Code(Yellow, Yellow, Orange, Pink)
    result CodeComparison(correct: 1, misplaced: 2)
>>> only keeping with  CodeComparison(correct: 1, misplaced: 2) for Code(Yellow, Yellow, Orange, Pink)
    40 remaining
>>> selecting best next guess
    0 Code(Yellow, Orange, Yellow, Yellow) eliminates at least 27
    1 Code(Yellow, Orange, Yellow, Orange) eliminates at least 30
    2 Code(Yellow, Orange, Yellow, Grey) eliminates at least 32
    3 Code(Yellow, Orange, Pink, Orange) eliminates at least 34
>>> guess 3 Code(Yellow, Orange, Pink, Orange)
    result CodeComparison(correct: 2, misplaced: 2)
>>> only keeping with  CodeComparison(correct: 2, misplaced: 2) for Code(Yellow, Orange, Pink, Orange)
    1 remaining
>>> selecting best next guess
    0 Code(Orange, Yellow, Pink, Orange) eliminates at least 0
>>> guess 4 Code(Orange, Yellow, Pink, Orange)
    result CodeComparison(correct: 4, misplaced: 0)
+++ Cracked Code(Orange, Yellow, Pink, Orange) with CodeComparison(correct: 4, misplaced: 0)

real  0m5.389s
user  0m4.260s
sys   0m0.705s
```

## Running all unit tests

```bash
$ make test
Compile Swift Module 'MasterMindTests' (1 sources)
Linking ./.build/debug/MasterMindPackageTests.xctest/Contents/MacOS/MasterMindPackageTests
Test Suite 'All tests' started at 2017-01-03 22:07:13.385
Test Suite 'MasterMindPackageTests.xctest' started at 2017-01-03 22:07:13.386
Test Suite 'CodeTests' started at 2017-01-03 22:07:13.386
Test Case '-[MasterMindTests.CodeTests testCodeByIndex]' started.
Test Case '-[MasterMindTests.CodeTests testCodeByIndex]' passed (0.008 seconds).
Test Case '-[MasterMindTests.CodeTests testCodeComparisonAllMisplaced]' started.
Test Case '-[MasterMindTests.CodeTests testCodeComparisonAllMisplaced]' passed (0.002 seconds).
Test Case '-[MasterMindTests.CodeTests testCodeComparisonEquality]' started.
Test Case '-[MasterMindTests.CodeTests testCodeComparisonEquality]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testCodeComparisonEverythingOkay]' started.
Test Case '-[MasterMindTests.CodeTests testCodeComparisonEverythingOkay]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testCodeComparisonHashValue]' started.
Test Case '-[MasterMindTests.CodeTests testCodeComparisonHashValue]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testCodeComparisonMixedResults]' started.
Test Case '-[MasterMindTests.CodeTests testCodeComparisonMixedResults]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testCodeComparisonNothingOkay]' started.
Test Case '-[MasterMindTests.CodeTests testCodeComparisonNothingOkay]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testCodeIndexBoundaries]' started.
Test Case '-[MasterMindTests.CodeTests testCodeIndexBoundaries]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testCodeSubscripting]' started.
Test Case '-[MasterMindTests.CodeTests testCodeSubscripting]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testDescription]' started.
Test Case '-[MasterMindTests.CodeTests testDescription]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testEqualCodes]' started.
Test Case '-[MasterMindTests.CodeTests testEqualCodes]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testIndexBasedColorInit]' started.
Test Case '-[MasterMindTests.CodeTests testIndexBasedColorInit]' passed (0.001 seconds).
Test Case '-[MasterMindTests.CodeTests testInvalidComparisonBoundaries]' started.
Test Case '-[MasterMindTests.CodeTests testInvalidComparisonBoundaries]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testNotEqualCodes]' started.
Test Case '-[MasterMindTests.CodeTests testNotEqualCodes]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testStringBasedColorInit]' started.
Test Case '-[MasterMindTests.CodeTests testStringBasedColorInit]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testTooFewParts]' started.
Test Case '-[MasterMindTests.CodeTests testTooFewParts]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testTooManyParts]' started.
Test Case '-[MasterMindTests.CodeTests testTooManyParts]' passed (0.000 seconds).
Test Case '-[MasterMindTests.CodeTests testValidComparisonBoundaries]' started.
Test Case '-[MasterMindTests.CodeTests testValidComparisonBoundaries]' passed (0.000 seconds).
Test Suite 'CodeTests' passed at 2017-01-03 22:07:13.400.
	 Executed 18 tests, with 0 failures (0 unexpected) in 0.013 (0.014) seconds
Test Suite 'MasterMindPackageTests.xctest' passed at 2017-01-03 22:07:13.400.
	 Executed 18 tests, with 0 failures (0 unexpected) in 0.013 (0.014) seconds
Test Suite 'All tests' passed at 2017-01-03 22:07:13.400.
	 Executed 18 tests, with 0 failures (0 unexpected) in 0.013 (0.016) seconds
```
