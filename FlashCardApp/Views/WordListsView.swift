import SwiftUI
import Foundation

struct WordListsView: View {
    @State private var wordLists: [WordList] = [
        WordList(name: "Week 1 Word Examples", words: [
            Word(term: "Uzi", definition: "The coolest Person."),
            Word(term: "Aimi", definition: "The Second Coolest Person")
        ]),
        WordList(name: "Week 2 Word Examples", words: [
            Word(term: "Uzi2", definition: "The coolest Person."),
            Word(term: "Aimi2", definition: "The Second Coolest Person")
        ])
    ]
    
    var body: some View {
        NavigationView {
            List(wordLists) { wordList in
                NavigationLink(destination: WordListView(wordList: wordList)) {
                    Text(wordList.name)

                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Word Lists")
                        .font(.largeTitle)
                        .bold()
                }
            }
        }
    }
}

struct WordListsView_Previews: PreviewProvider {
    static var previews: some View {
        WordListsView()
    }
}
