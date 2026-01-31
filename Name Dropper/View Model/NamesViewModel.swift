//
//  NamesManager.swift
//  Name Dropper
//
//  Created by CCS038 on 30/01/26.
//

import Foundation

@Observable
class NamesViewModel {
    private let namesKey = "saved_names"
    
    var names: [String] = [] {
        didSet {
            saveNames()
        }
    }
    
    init() {
        loadNames()
    }
    
    let availableNames = ["Shreyas", "Rohan", "Ram", "Gopal", "Krishna"]
    
    func addRandomName() {
        if let randomName = availableNames.randomElement() {
            names.append(randomName)
        }
    }
    
    func deleteName(at: IndexSet) {
        names.remove(atOffsets: at)
    }
    
    func moveName(from source: IndexSet, to destination: Int) {
        names.move(fromOffsets: source, toOffset: destination)
    }
    
    func saveNames() {
        UserDefaults.standard.set(names, forKey: namesKey)
    }
    
    func loadNames() {
        guard let savedNames = UserDefaults.standard.stringArray(forKey: namesKey) else {
            return
        }
        names = savedNames
    }
}
