# MasterMind

A small project to dive into the Swift programming language.    
Christophe VG (<contact@christophe.vg>)  
[https://github.com/christophevg/mastermind](https://github.com/christophevg/mastermind)

## Running the solver...
```bash
$ time make
Compile Swift Module 'MasterMind' (2 sources)
Linking ./.build/debug/MasterMind
+++ The code to crack is Code(Blue, Orange, Grey, Red)
>>> guess 0 Code(Pink, Orange, Green, Blue)
    result CodeComparison(correct: 1, misplaced: 1)
>>> only keeping with  CodeComparison(correct: 1, misplaced: 1) for Code(Pink, Orange, Green, Blue)
    660 remaining
>>> selecting best next guess
    1 Code(White, White, Orange, Blue) eliminates at least 460
    5 Code(White, Yellow, Orange, Blue) eliminates at least 513
>>> guess 1 Code(White, Yellow, Orange, Blue)
    result CodeComparison(correct: 0, misplaced: 2)
>>> only keeping with  CodeComparison(correct: 0, misplaced: 2) for Code(White, Yellow, Orange, Blue)
    141 remaining
>>> selecting best next guess
    1 Code(Yellow, White, Green, Pink) eliminates at least 89
    2 Code(Yellow, Orange, Yellow, Pink) eliminates at least 108
    3 Code(Yellow, Orange, Yellow, Green) eliminates at least 113
    4 Code(Yellow, Orange, Red, Pink) eliminates at least 116
    43 Code(Red, Orange, White, Green) eliminates at least 118
>>> guess 2 Code(Red, Orange, White, Green)
    result CodeComparison(correct: 1, misplaced: 1)
>>> only keeping with  CodeComparison(correct: 1, misplaced: 1) for Code(Red, Orange, White, Green)
    23 remaining
>>> selecting best next guess
    1 Code(Yellow, Orange, Red, Pink) eliminates at least 13
    2 Code(Yellow, Orange, Pink, Red) eliminates at least 16
    4 Code(Orange, Orange, Blue, Red) eliminates at least 19
>>> guess 3 Code(Orange, Orange, Blue, Red)
    result CodeComparison(correct: 2, misplaced: 1)
>>> only keeping with  CodeComparison(correct: 2, misplaced: 1) for Code(Orange, Orange, Blue, Red)
    2 remaining
>>> selecting best next guess
    1 Code(Blue, Orange, Red, Red) eliminates at least 1
>>> guess 4 Code(Blue, Orange, Red, Red)
    result CodeComparison(correct: 3, misplaced: 0)
>>> only keeping with  CodeComparison(correct: 3, misplaced: 0) for Code(Blue, Orange, Red, Red)
    1 remaining
>>> selecting best next guess
    1 Code(Blue, Orange, Grey, Red) eliminates at least 0
>>> guess 5 Code(Blue, Orange, Grey, Red)
    result CodeComparison(correct: 4, misplaced: 0)
+++ Cracked code Code(Blue, Orange, Grey, Red)

real  0m28.350s
user  0m26.412s
sys   0m1.379s
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
