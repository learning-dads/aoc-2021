import Foundation

public class Puzzle {
    public let inputs: String
    public let newInput: Input

    public init() {
        let className = String(cString: class_getName(type(of: self)))
        let fileName = String(className.split(separator: ".").last! + ".swift")

        // Search inside the module folder for the swift file …
        let root = URL(fileURLWithPath: "\(#file)").deletingLastPathComponent()
        let rootEnumerator = FileManager.default.enumerator(at: root, includingPropertiesForKeys: nil)
        let filePaths = rootEnumerator?.allObjects as! [URL]
        let filePath = filePaths.filter { $0.pathComponents.contains(fileName) }.first!

        // … to search inside the day folder …
        let dayFolder = filePath.deletingLastPathComponent()
        let enumerator = FileManager.default.enumerator(at: dayFolder, includingPropertiesForKeys: nil)

        // … for the input file.
        var inputURL: URL?
        while let next = enumerator?.nextObject() as? URL {
            if next.pathComponents.contains("input.txt") == false { continue }
            inputURL = next
        }

        inputs = try! String(contentsOf: inputURL!)
        newInput = Input(file: inputURL!)
    }

    func results() -> (p1: String, p2: String) { (part1(), part2()) }

    func part1() -> String { fatalError("Implement \(#function)") }

    func part2() -> String { fatalError("Implement \(#function)") }
}


public class Input {
    public convenience init(file: URL) { self.init(try! String(contentsOf: file)) }
    public init(_ raw: String) { self.raw = raw.trimmingCharacters(in: .newlines) }

    public let raw: String

    public lazy var lines: Array<String> = { return raw.components(separatedBy: .newlines).map { String($0) } }()
}
