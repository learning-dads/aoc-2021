import Foundation

public struct Day2: Puzzle {
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
        let commands = inputs.split { $0.isNewline }

        var position = CGPoint(x: 0, y: 0)
        for command in commands {
            let operand = command.split(separator: " ")
            let units = CGFloat(Int(operand[1])!)

            switch operand[0] {
            case "forward":
                position.x += units
            case "down":
                position.y += units
            case "up":
                position.y -= units
            default:
                fatalError()
            }
        }

        return "\(Int(position.x * position.y))"
    }

    func part2() -> String {
        let commands = inputs.split { $0.isNewline }

        var position: (x: Int, y: Int, aim: Int) = (0,0,0)
        for command in commands {
            let operand = command.split(separator: " ")
            let units = Int(operand[1])!

            switch operand[0] {
            case "forward":
                position.x += units
                position.y += (units * position.aim)
            case "down":
                position.aim += units
            case "up":
                position.aim -= units
            default:
                fatalError()
            }
        }

        return "\(Int(position.x * position.y))"
    }
}
