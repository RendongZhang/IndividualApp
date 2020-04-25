//
//  ItemStore.swift
//  IndividualApp
//
//  Created by Rendong Zhang 
//  Copyright © 2020 Rendong Zhang. All rights reserved.
//

import Foundation
import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    } ()
    
    init() {
        do {
            
            let data =  try Data(contentsOf: itemArchiveURL)
            
            if let archivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Item] {
                allItems = archivedData
            }
        } catch {
            print("itemstore  initialized")
            let item1 = Item(name: "1", sales: "2", company: "3", year: "33")
            allItems = [item1]
        }
    }

    @discardableResult func createItem(_ name: String,_ sales: String,_ company: String, _ year : String) -> Item {
        let newItem = Item(name: name, sales: sales, company: company, year: year)
        allItems.append(newItem)
        return newItem

    }
    
    func removeItem(_ item:Item){
        if let index = allItems.firstIndex(of:item){
            allItems.remove(at: index)
        }
        
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        // get item from array
        let movedItem = allItems[fromIndex]
        // rmove item from array
        allItems.remove(at: fromIndex)
        // insert it in the array at the new position
        allItems.insert(movedItem, at: toIndex)
        
    }
    
    func saveChanges()  {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: allItems, requiringSecureCoding: false)
            try data.write(to:itemArchiveURL)
            print(itemArchiveURL)
           
        } catch {
            print("cannot save changes")
        }
    }
    
}
