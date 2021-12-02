import Foundation
import Algorithms

public class Day1: Puzzle {
    override func part1() -> String {
        let lines = inputs.split { $0.isNewline }
            .map { Int($0)! }

        let numberOfIncreases = lines.adjacentPairs().map { $0 < $1 }
            .filter { $0 == true }
            .count

        return "\(numberOfIncreases)"
    }

    override func part2() -> String {
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
