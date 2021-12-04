import Foundation

public class Day4: Puzzle {
    lazy var numbers: [Int] = {
        inputs.split { $0.isNewline }
        .first!
        .split(separator: ",")
        .map { Int($0)! }
    }()

    lazy var cards: [BingoCard] = {
        let boardInputs = newInput.lines.dropFirst().chunks(ofCount: 6)

        return boardInputs.map { lines in
            let boardStrings = lines.dropFirst().joined(separator: " ")
            let boardInts = boardStrings.split(separator: " ").map { Int(String($0))! }
            let card = BingoCard(boardInts)
            return card
        }
    }()

    override func part1() -> String {
        for number in numbers {
            for card in cards {
                card.search(number)
                if card.bingo() == true {
                    return "\(card.score())"
                }
            }
        }
        fatalError()
    }

    override func part2() -> String {
        "\(#function)"
    }
}

public class BingoCard {
    internal let card: [Int]
    internal let rows = [(0..<5), (5..<10), (10..<15), (15..<20), (20..<25)]
    internal let columns = [[0,5,10,15,20], [1,6,11,16,21], [2,7,12,17,22], [3,8,13,18,23], [4,9,14,19,24]]
    internal var marked: [Int] = []
    internal var lastNumber: Int = 0

    public init(_ numbers: [Int]) {
        card = numbers
    }

    public func search(_ number: Int) {
        if let mark = card.firstIndex(of: number) {
            lastNumber = number
            marked.append(mark)
        }
    }

    public func bingo() -> Bool {
        let result = marked.sorted()

        let rowResult = rows.map { result.filter($0.contains).count == 5 }.contains(true)
        let columnResult = columns.map { result.filter($0.contains).count == 5 }.contains(true)

        return rowResult || columnResult
    }

    public func score() -> Int {
        var tmp = card

        _ = marked.sorted().reversed().map { tmp.remove(at: $0) }

        return tmp.reduce(0, +) * lastNumber
    }
}
