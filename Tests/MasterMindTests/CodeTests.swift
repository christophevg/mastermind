import XCTest
@testable import MasterMind

class CodeTests: XCTestCase {

  func testDescription() {
    let code = try! Code([.red, .green, .yellow, .blue])
    XCTAssertEqual(String(describing:code), "Code(Red, Green, Yellow, Blue)")
    let code2 = try! Code([.pink, .orange, .white, .grey])
    XCTAssertEqual(String(describing:code2), "Code(Pink, Orange, White, Grey)")
  }

  private func createCodeWithInvalidPartsCount(_ parts:[Color]) {
    do {
      let _ = try Code(parts)
      XCTFail("Should have thrown.")
    } catch let error as CodeError {
      XCTAssertEqual(error, .invalidPartsCount)
    } catch {
      XCTFail("Invalid Error.")
    }
  }

  func testTooFewParts() {
    self.createCodeWithInvalidPartsCount([.red])
  }

  func testTooManyParts() {
    self.createCodeWithInvalidPartsCount([.red, .green, .blue, .yellow, .grey])
  }

  func testEqualCodes() {
    let code1 = try! Code([.red, .green, .blue, .yellow])
    let code2 = try! Code([.red, .green, .blue, .yellow])
    XCTAssertEqual(code1, code2)
  }

  func testNotEqualCodes() {
    let code1 = try! Code([.red, .green, .blue, .yellow])
    let code2 = try! Code([.blue, .green, .blue, .yellow])
    XCTAssertNotEqual(code1, code2)
  }

  static var allTests : [(String, (CodeTests) -> () throws -> Void)] {
    return [
      ( "testDescription",   testDescription   ),
      ( "testTooFewParts",   testTooFewParts   ),
      ( "testTooManyParts",  testTooManyParts  ),
      ( "testEqualCodes",    testEqualCodes    ),
      ( "testNotEqualCodes", testNotEqualCodes ),
    ]
  }
}
