# MasterMind

A small project to dive into the Swift programming language.    
Christophe VG (<contact@christophe.vg>)  
[https://github.com/christophevg/mastermind](https://github.com/christophevg/mastermind)

## Running the solver...
```bash
$ time make
Compile Swift Module 'MasterMind' (2 sources)
Linking ./.build/debug/MasterMind
+++ The code to crack is Code(Green, Orange, Orange, Green)
>>> guess 0 Code(Grey, Blue, Red, White)
    result CodeComparison(correct: 0, misplaced: 0)
>>> only keeping with  CodeComparison(correct: 0, misplaced: 0) for Code(Grey, Blue, Red, White)
    256 remaining
>>> selecting best next guess
    586 Code(Yellow, Yellow, Yellow, Yellow) eliminates at least 148
    587 Code(Yellow, Yellow, Yellow, Orange) eliminates at least 205
    597 Code(Yellow, Yellow, Orange, Pink) eliminates at least 210
>>> guess 1 Code(Yellow, Yellow, Orange, Pink)
    result CodeComparison(correct: 1, misplaced: 0)
>>> only keeping with  CodeComparison(correct: 1, misplaced: 0) for Code(Yellow, Yellow, Orange, Pink)
    18 remaining
>>> selecting best next guess
    950 Code(Yellow, Green, Green, Green) eliminates at least 14
>>> guess 2 Code(Yellow, Green, Green, Green)
    result CodeComparison(correct: 1, misplaced: 1)
>>> only keeping with  CodeComparison(correct: 1, misplaced: 1) for Code(Yellow, Green, Green, Green)
    4 remaining
>>> selecting best next guess
    3221 Code(Green, Orange, Orange, Green) eliminates at least 2
    3473 Code(Green, Green, Orange, Orange) eliminates at least 3
>>> guess 3 Code(Green, Green, Orange, Orange)
    result CodeComparison(correct: 2, misplaced: 2)
>>> only keeping with  CodeComparison(correct: 2, misplaced: 2) for Code(Green, Green, Orange, Orange)
    1 remaining
>>> selecting best next guess
    3221 Code(Green, Orange, Orange, Green) eliminates at least 0
>>> guess 4 Code(Green, Orange, Orange, Green)
    result CodeComparison(correct: 4, misplaced: 0)
+++ Cracked code Code(Green, Orange, Orange, Green)

real	1m6.664s
user	1m4.371s
sys 0m1.562s
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
