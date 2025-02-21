import SwiftUI

struct FlashcardView: View {
    let wordListName: String
    let words: [Word]
    @State private var currentIndex: Int
    @State private var showDefinition = false
    
    init(wordListName: String, words: [Word], initialWord: Word) {
        self.wordListName = wordListName
        self.words = words
        self._currentIndex = State(initialValue: words.firstIndex(where: { $0.id == initialWord.id}) ?? 0)
    }
    
    var body: some View {
        VStack {
            Text("Card \(currentIndex + 1) of \(words.count)")
                .font(.largeTitle)
                .padding(.bottom, 50)
            Text(showDefinition ? words[currentIndex].definition : words[currentIndex].term)
                .font(.largeTitle)
                .padding()
                .frame(width: 350, height: 280)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(15)
                .onTapGesture {
                    showDefinition.toggle()
                }
                .gesture(
                    DragGesture()
                        .onEnded { gesture in
                            if gesture.translation.width < -50 {
                                moveToNextWord()
                            }
                            else if gesture.translation.width > 50 {
                                moveToPreviousWord()
                            }
                        }
                )
        }
        .padding(.bottom, 70)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(wordListName)
                    .font(.title)
                    .bold()
            }
        }
    }
    private func moveToNextWord() {
        if currentIndex < words.count - 1 {
            currentIndex += 1
        }
        else {
            currentIndex = 0
        }
        showDefinition = false

    }

    private func moveToPreviousWord() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
        else {
            currentIndex = words.count - 1
        }
        showDefinition = false

    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(wordListName: "Example List", words: [
                    Word(term: "Example1", definition: "A sample definition."),
                    Word(term: "Example1", definition: "A sample definition.")
                ],
                      initialWord: Word(term: "Example 1", definition: "Definition 1"))
    }
}
