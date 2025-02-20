import SwiftUI

struct WordListView: View {
    let wordList: WordList
    
    var body: some View {
        List(wordList.words) { word in
            Text(word.term)
        }
        .navigationTitle(wordList.name)
    }
}

struct WordListView_Previews: PreviewProvider {
    static var previews: some View {
        WordListView(wordList: WordList(name: "Example", words: [
            Word(term: "Test", definition: "A Sample Word")
        ]))
    }
}

