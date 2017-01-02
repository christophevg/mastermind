import XCTest
@testable import MasterMind

class CodeTests: XCTestCase {

  func testDescription() {
    let code = try! Code([.red, .green, .yellow, .blue])
    XCTAssertEqual(String(describing:code), "Code(Red, Green, Yellow, Blue)")
  }

  func testTooFewParts() {
    do {
      let _ = try Code([.red])
      XCTFail("Should have thrown.")
    } catch let error as CodeError {
      XCTAssertEqual(error, .invalidPartsCount)
    } catch {
      XCTFail("Invalid Error.")
    }
  }

  func testTooManyParts() {
    do {
      let _ = try Code([.red, .green, .blue, .yellow, .grey])
      XCTFail("Should have thrown.")
    } catch let error as CodeError {
      XCTAssertEqual(error, .invalidPartsCount)
    } catch {
      XCTFail("Invalid Error.")
    }
  }

  static var allTests : [(String, (CodeTests) -> () throws -> Void)] {
    return [
      ( "testDescription",  testDescription  ),
      ( "testTooFewParts",  testTooFewParts  ),
      ( "testTooManyParts", testTooManyParts ),
    ]
  }
}
