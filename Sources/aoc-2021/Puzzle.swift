import Foundation

protocol Puzzle {
    func part1() -> String
    func part2() -> String
    func results() -> (p1: String, p2: String)
}

extension Puzzle {
    func results() -> (p1: String, p2: String) { (part1(), part2()) }
}
