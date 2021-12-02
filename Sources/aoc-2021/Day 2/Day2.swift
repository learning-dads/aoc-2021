import Foundation

public class Day2: Puzzle {
    override func part1() -> String {
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

    override func part2() -> String {
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
