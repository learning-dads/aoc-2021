import XCTest
@testable import day2

final class day2Tests: XCTestCase {
    func testPuzzleOnePosition() throws {
        let inputURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let input = try! String(contentsOf: inputURL)

        XCTAssertEqual(PuzzleOne(input).submarinePosition, CGPoint(x: 1909, y: 655))
    }

    func testPuzzleOneMultiplication() throws {
        let inputURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let input = try! String(contentsOf: inputURL)

        XCTAssertEqual(PuzzleOne(input).multiplication, 1250395)
    }

    func testPuzzleTwoPosition() throws {
        let inputURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let input = try! String(contentsOf: inputURL)

        XCTAssertEqual(PuzzleTwo(input).submarinePosition, CGPoint(x: 1909, y: 760194))
    }

    func testPuzzleTwoMultiplication() throws {
        let inputURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let input = try! String(contentsOf: inputURL)

        XCTAssertEqual(PuzzleTwo(input).multiplication, 1451210346)
    }
}
