import Foundation

public class Day3: Puzzle {
    override func part1() -> String {
        // Construct a [[String]] from input
        let stringsArray = inputs.split { $0.isNewline }
            .map { $0.map { String($0) } }

        let transposedBinaries = transpose(input: stringsArray)

        let gamma = transposedBinaries.map { (transposedBinary) -> String in
            let zeros = transposedBinary.filter { $0 == "0" }.count
            let ones = transposedBinary.filter { $0 == "1" }.count

            let result = zeros > ones ? "0" : "1"

            print("\(transposedBinary) has \(zeros)x 0, \(ones)x 1: \(result)")

            return result
        }.joined(separator: "")

        let gammaInt = Int(gamma, radix: 2)!
        let epsilon = String((~gammaInt & 0xFFF), radix: 2)
        let epsilonInt = Int(epsilon, radix: 2)!

        return "\(gammaInt * epsilonInt)"
    }

    override func part2() -> String {
        return ""
    }

    // Kudos to https://stackoverflow.com/a/32922962/1712728
    public func transpose<T>(input: [[T]]) -> [[T]] {
        if input.isEmpty { return [[T]]() }
        let count = input[0].count
        var out = [[T]](repeating: [T](), count: count)
        for outer in input {
            for (index, inner) in outer.enumerated() {
                out[index].append(inner)
            }
        }

        return out
    }
}
