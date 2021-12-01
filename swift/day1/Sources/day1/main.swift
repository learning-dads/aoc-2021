import Foundation

let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")
let input = try! String(contentsOf: fileURL!)

let lines = input.split { $0.isNewline }
    .map { Int($0) }

let numberOfIncreases = zip(lines, lines.dropFirst()).map { $0! < $1! }
    .filter { $0 == true }
    .count

print(numberOfIncreases)
