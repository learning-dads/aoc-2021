import Foundation
import Algorithms

let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")
let input = try! String(contentsOf: fileURL!)

let lines = input.split { $0.isNewline }
    .map { Int($0)! }

let numberOfIncreases = lines.adjacentPairs().map { $0 < $1 }
    .filter { $0 == true }
    .count

print("Part 1: \(numberOfIncreases)")

extension Sequence where Element: Numeric {
    /// Returns the sum of all elements in the collection
    func sum() -> Element { return reduce(0, +) }
}

let reducedWindows = lines
    .windows(ofCount: 3)
    .map { $0.sum() }

let result = reducedWindows
    .adjacentPairs()
    .map { $0 < $1 }
    .filter { $0 == true }
    .count

print("Part 2: \(result)")
