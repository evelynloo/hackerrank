import Foundation

guard let count = readLine().flatMap({ Int($0) }) else { fatalError("No count") }

let lines = AnyIterator{ readLine() }.prefix(count)

let regex = "\\([+-]?(90(\\.0+)?|([1-8][0-9]|[1-9])(\\.\\d+)?), [+-]?(180(\\.0+)?|(1[0-7][0-9]|[1-9][0-9]|[1-9])(\\.\\d+)?)\\)"

let regexFormatter = try! NSRegularExpression(pattern: regex, options: .dotMatchesLineSeparators)

for text in lines {
    let matches = regexFormatter.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
    if (matches.count == 0) {
        print("Invalid")
    }
    else {
        print("Valid")
    }
}