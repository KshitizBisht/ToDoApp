//
//  AddToDoView.swift
//  ToDoApp
//
//  Created by Kshitiz Bisht on 15/06/2023.
//

import SwiftUI

struct AddToDoView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var appData: ApplicationData
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            VStack {
                Form{
                    // MARK: - TODO NAME
                    TextField("Todo", text: $name)
                    
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority){
                        ForEach(priorities, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button("Save"){
                        let toDoThing = name.trimmingCharacters(in: .whitespaces)
                        if !toDoThing.isEmpty{
                            appData.saveToDoItem(item: ToDo(item: toDoThing))
                            dismiss()
                        }
                    }
                } //: FORM
                Spacer()
                
            } //: VSTACK
            .navigationTitle("NEW TODO").navigationBarTitleDisplayMode(.inline)
            
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
    }
}

