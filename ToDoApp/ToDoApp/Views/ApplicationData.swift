//
//  ApplicationData.swift
//  ToDoApp
//
//  Created by Kshitiz Bisht on 16/06/2023.
//
import SwiftUI
import Foundation

struct ToDo: Codable{
    var item: String
}

struct ToDoViewModel: Identifiable{
    let id: UUID = UUID()
    var toDo: ToDo
    
    var toDoItem: String{
        return toDo.item.capitalized
    }
}

class ApplicationData: ObservableObject{
    @Published var userData: [ToDoViewModel] = []
    var manager: FileManager
    var docURL: URL
    
    
    init(){
        manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        docURL = documents.first!
        
        let fileURL = docURL.appendingPathComponent("userdata.dat")
        let path = fileURL.path
        if manager.fileExists(atPath: path){
            if let content = manager.contents(atPath: path){
                let decoder = PropertyListDecoder()
                if let list = try? decoder.decode([ToDo].self, from: content){
                    userData = list.map({value in
                        return ToDoViewModel(toDo: value)
                    })
                }
            }
        }
    }
    
    func saveToDoItem(item: ToDo){
        userData.append(ToDoViewModel(toDo: item))
        saveModel()
    }
    
    func saveModel(){
        let list = userData.map({value in
            return value.toDo
        })
        
        let fileURL = docURL.appendingPathComponent("userdata.dat")
        let path = fileURL.path
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(list){
            manager.createFile(atPath: path, contents: data, attributes: nil)
        }
    }
}

