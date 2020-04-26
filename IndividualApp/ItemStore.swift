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
            //create 4 example cells
            print("itemstore  initialized")
            let item1 = Item(name: "Shooting game", sales: "200", company: "RZ", year: "1998")
            let item2 = Item(name: "Game1", sales: "100", company: "RDZ", year: "2020")
            let item3 = Item(name: "VideoGame 2", sales: "12912", company: "Rendong", year: "2004")
            let item4 = Item(name: "Role playing game ", sales: "123118", company: "Zhang", year: "2016")
            allItems = [item1,item2,item3,item4]
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
          
           
        } catch {
            print("cannot save changes")
        }
    }
    
}
