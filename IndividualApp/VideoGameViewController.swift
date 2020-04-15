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
    
  
    
    override func viewDidLoad() {
        let itemArchiveURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory,
        in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
        }()
        super.viewDidLoad()
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vg.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGameCell", for: indexPath) as! Cell
        cell.Name.text = vg[indexPath.row][0]
        cell.NumPlayers.text = vg[indexPath.row][1] 
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.getName = vg[indexPath.row][0]
        vc.getSales = vg[indexPath.row][1]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObj = vg[sourceIndexPath.item]
        vg.remove(at: sourceIndexPath.item)
        vg.insert(movedObj, at: destinationIndexPath.item)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            // ask user to confirm
            let item = vg[indexPath.row]
            let title = "Delete \(item[0])?"
            let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            // remove the item from the store
            vg.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            })
            ac.addAction(deleteAction)
            // put up the controller as a modal view
            present(ac, animated: true, completion: nil)
            
//            vg.remove(at: indexPath.item)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title =  (self.tableView.isEditing) ? "Done" : "Edit"
    }

    
}

