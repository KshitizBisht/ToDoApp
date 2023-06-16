//
//  ContentView.swift
//  ToDoApp
//
//  Created by Kshitiz Bisht on 15/06/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var appData: ApplicationData
    @State private var openAddToDo: Bool = false
    
    var body: some View{
        NavigationStack{
            List{
                ForEach(appData.userData){ toDo in
                    RowItem(toDoItem: toDo)
                    
                }
            }
            .navigationTitle("ToDo List")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        openAddToDo = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }.sheet(isPresented: $openAddToDo){
                AddToDoView()
            }
        }
    }
}

struct RowItem: View{
    let toDoItem: ToDoViewModel
    
    var body: some View{
        Text(toDoItem.toDoItem)
            .bold()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ApplicationData())
    }
}
