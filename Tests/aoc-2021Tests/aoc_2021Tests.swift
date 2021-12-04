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

        let p = day.results()

        XCTAssertEqual(p.p1, "1250395")
        XCTAssertEqual(p.p2, "1451210346")
    }

    func testDay3() {
        let day = Day3()

        let p = day.results()

        XCTAssertEqual(p.p1, "2724524")
        XCTAssertEqual(p.p2, "2775870")
    }

    func testDay4() {
        let day = Day4()

        let p = day.results()

        XCTAssertEqual(p.p1, "10680")
        XCTAssertEqual(p.p2, "")
    }
}
