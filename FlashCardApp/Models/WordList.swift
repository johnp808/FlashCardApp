import Foundation

struct WordList: Identifiable, Codable {
    var id = UUID()
    var name: String
    var words: [Word]
}
