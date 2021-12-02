import Foundation

public struct Day1 {
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
}
