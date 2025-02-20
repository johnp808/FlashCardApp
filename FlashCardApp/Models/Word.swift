import Foundation

struct Word: Identifiable, Codable {
    var id = UUID()
    var term: String
    var definition: String
}
