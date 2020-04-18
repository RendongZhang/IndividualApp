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
    
    var dataStore = UserDefaults.standard
    
    override func viewDidLoad() {
//
       

//        self.tableView.reloadData()
//        let vgArray = UserDefaults.standard.value(forKey: "vgArrs")as! [[String]]
//        if vgArray.count < tableView.numberOfRows(inSection: 0){
//
//            tableView.deleteRows(at: [IndexPath(row: UserDefaults.standard.value(forKey: "deletedRow") as! Int, section: 0)], with: .automatic)
//        }
        print("test0")
        super.viewDidLoad()
        print("test1")
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vgArray = UserDefaults.standard.value(forKey: "vgArrs")as! [[String]]
        
        return vgArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let vgArray = UserDefaults.standard.value(forKey: "vgArrs")as! [[String]]
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGameCell", for: indexPath) as! Cell
            cell.Name.text = vgArray[indexPath.row][0]
            cell.NumPlayers.text = vgArray[indexPath.row][1]
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vgArray = UserDefaults.standard.value(forKey: "vgArrs")as! [[String]]
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.getName = vgArray[indexPath.row][0]
        vc.getSales = vgArray[indexPath.row][1]
        vc.getCompany = vgArray[indexPath.row][2]
        vc.getYear = vgArray[indexPath.row][3]
      
        dataStore.set(indexPath.item, forKey: "selectedRowIndex")
        print("select row : ", indexPath.item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var vgArray = UserDefaults.standard.value(forKey: "vgArrs")as! [[String]]
        let movedObj = vgArray[sourceIndexPath.item]
        vgArray.remove(at: sourceIndexPath.item)
        vgArray.insert(movedObj, at: destinationIndexPath.item)
        dataStore.set(vgArray, forKey: "vgArrs")
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        var vgArray = UserDefaults.standard.value(forKey: "vgArrs")as! [[String]]

        
        if editingStyle == .delete{
            // ask user to confirm
            let item = vgArray[indexPath.row]
            let title = "Delete \(item[0])?"
            let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
                // remove the item from the store
                vgArray.remove(at: indexPath.item)
                self.dataStore.set(vgArray, forKey: "vgArrs")
                tableView.deleteRows(at: [indexPath], with: .automatic)
            
            })
            
            ac.addAction(deleteAction)
            // put up the controller as a modal view
          
            present(ac, animated: true, completion: nil)
            
//            vg.remove(at: indexPath.item)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
    }


    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title =  (self.tableView.isEditing) ? "Done" : "Edit"
    }

    
}


