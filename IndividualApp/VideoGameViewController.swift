//
//  VideoGameViewController.swift
//  IndividualApp
//
//  Created by Rendong Zhang on 3/28/20.
//  Copyright © 2020 Rendong Zhang. All rights reserved.
//

import UIKit

class VideoGameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    

    
    var selectedRowIndex : Int = Int()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let itemStore = ItemStore()
        return itemStore.allItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {

            let itemStore = ItemStore()
              let item = itemStore.allItems[indexPath.row]
              let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGameCell", for: indexPath) as! Cell
            cell.Name.text = item.name
            cell.NumPlayers.text = item.sales
            cell.Company.text = item.company
            return cell
                
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let itemStore = ItemStore()
          let item = itemStore.allItems[indexPath.row]
          let Storyboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.selectedRowIndex = indexPath.row
        vc.getName = item.name
        vc.getSales = item.sales
        vc.getCompany = item.company
        vc.getYear = item.year
        self.selectedRowIndex = indexPath.row
        
          
          print("select row : ", indexPath.item)
          self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

        let itemStore = ItemStore()
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        itemStore.saveChanges()
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        
        if editingStyle == .delete{

              // ask user to confirm
            let itemStore = ItemStore()
              let item = itemStore.allItems[indexPath.row]
            let title = "Delete \(item.name)?"
              let message = "Are you sure you want to delete this item?"
              let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
              let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
              ac.addAction(cancelAction)
              let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
                  // remove the item from the store
                  itemStore.removeItem(item)
                  itemStore.saveChanges()
                  //also remove that row from the table view, with animation
                  tableView.deleteRows(at: [indexPath], with: .automatic)
              
              })
              
              ac.addAction(deleteAction)
              // put up the controller as a modal view
            
              present(ac, animated: true, completion: nil)
            

            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _ = ItemStore()
        self.tableView.reloadData()
        
        
        
    }


    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title =  (self.tableView.isEditing) ? "Done" : "Edit"
    }

    
}


