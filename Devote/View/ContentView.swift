//
//  ContentView.swift
//  Devote
//
//  Created by Davide Aliti on 25/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var task: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 16) {
                    TextField("New task", text: $task)
                        .padding()
                        .background(Color(uiColor: UIColor.systemGray6))
                        .cornerRadius(10)
                    Button {
                        addItem()
                    } label: {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(isButtonDisabled ? .gray : .pink)
                    .cornerRadius(10)
                    .disabled(isButtonDisabled)

                }
                .padding()
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                        } label: {
                            VStack {
                                Text(item.task ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            } //: VStack
            .navigationTitle("Daily tasks")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            Text("Select an item")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
