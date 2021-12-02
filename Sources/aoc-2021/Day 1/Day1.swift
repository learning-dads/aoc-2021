import Foundation
import Algorithms

public struct Day1: Puzzle {
    let inputs: String

    init() {
        let root = URL(fileURLWithPath: "\(#file)").deletingLastPathComponent()
        let enumerator = FileManager.default.enumerator(at: root, includingPropertiesForKeys: nil)

        var inputURL: URL?
        while let next = enumerator?.nextObject() as? URL {
            if next.pathComponents.contains("input.txt") == false {
                continue
            }
            inputURL = next
        }

        inputs = try! String(contentsOf: inputURL!)
    }

    func part1() -> String {
        let lines = inputs.split { $0.isNewline }
            .map { Int($0)! }

        let numberOfIncreases = lines.adjacentPairs().map { $0 < $1 }
            .filter { $0 == true }
            .count

        return "\(numberOfIncreases)"
    }

    func part2() -> String {
        let lines = inputs.split { $0.isNewline }
            .map { Int($0)! }

        let reducedWindows = lines
            .windows(ofCount: 3)
            .map { $0.sum() }

        let result = reducedWindows
            .adjacentPairs()
            .map { $0 < $1 }
            .filter { $0 == true }
            .count

        return "\(result)"
    }
}

extension Sequence where Element: Numeric {
    /// Returns the sum of all elements in the collection
    func sum() -> Element { return reduce(0, +) }
}
