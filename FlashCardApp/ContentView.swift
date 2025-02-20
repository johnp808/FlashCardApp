//
//  ContentView.swift
//  FlashCardApp

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        VStack {
            Text("Hello, Aimi!")
                .font(.largeTitle)
                .padding()
            Text("My Baby Chans!").font(.title)
            Text("🍏👩🏻‍💻").font(.title)
        }
    }
    
    struct ContentView_previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
