import XCTest
@testable import aoc_2021

final class aoc_2021Tests: XCTestCase {
    func testDay1() {
        let day = Day1()

        let p = day.results()

        XCTAssertEqual(p.p1, "1288")
        XCTAssertEqual(p.p2, "1311")
    }

    func testDay2() {
        let day = Day2()
    }
}
