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

            return result
        }.joined(separator: "")

        let gammaInt = Int(gamma, radix: 2)!
        let epsilon = String((~gammaInt & 0xFFF), radix: 2)
        let epsilonInt = Int(epsilon, radix: 2)!

        return "\(gammaInt * epsilonInt)"
    }

    override func part2() -> String {
        let stringsArray = inputs.split { $0.isNewline }
            .map { $0.map { String($0) } }

        let oxygen = find(readings: stringsArray, for: .oxygenGenerator)
        let co2 = find(readings: stringsArray, for: .co2Scrubber)

        return "\(oxygen * co2)"
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

    public enum LifeSupportRating {
        case oxygenGenerator
        case co2Scrubber
    }

    public func find(readings stringsArray: [[String]], for rating: LifeSupportRating = .oxygenGenerator) -> Int {
        let transposedBinaries = transpose(input: stringsArray)

        var indices = stringsArray.indices.map { $0 }

        var reading = [String]()
        for transposedBinary in transposedBinaries {
            if indices.count == 1 {
                reading = [stringsArray[indices.first!].joined(separator: "")]
                continue
            }

            var binary = transposedBinary

            var foo: [String] = []
            for index in indices {
                foo.append(binary[index])
            }
            binary = foo

            let zeros = binary.filter { $0 == "0" }.count
            let ones = binary.filter { $0 == "1" }.count

            let result = zeros > ones ? "0" : "1"

            for index in binary.indices.filter({
                switch rating {
                case .oxygenGenerator:
                    return binary[$0] != result
                case .co2Scrubber:
                    return binary[$0] == result
                }
            }).reversed() {
                indices.remove(at: index)
            }

            reading = indices.map { stringsArray[$0].joined(separator: "") }
        }

        return Int(reading.first!, radix: 2)!
    }
}
