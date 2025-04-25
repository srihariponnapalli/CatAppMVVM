//
//  ContentView.swift
//  CatAppMVVM
//
//  Created by user260574 on 4/25/25.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CatViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.orange.ignoresSafeArea() // Set a nice background color
                
                if let url = URL(string: viewModel.catImageURL) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                            .ignoresSafeArea() // Ensure the image extends to the edges
                    } placeholder: {
                        ProgressView()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .ignoresSafeArea() // Ensure the placeholder extends to the edges
                    }
                } else {
                    Color.black.ignoresSafeArea()
                    Text("Image not available")
                        .foregroundColor(.white)
                }
                
                VStack {
                    Spacer()
                    Text(viewModel.catFact)
                        .padding()
                        .background(Color.black.opacity(0.6))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .frame(width: geometry.size.width - 40) // Adjust padding to fit within screen width
                }
            }
            .onTapGesture {
                viewModel.fetchCatData()
            }
            .onAppear {
                viewModel.fetchCatData()
            }
        }
    }
}







//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
