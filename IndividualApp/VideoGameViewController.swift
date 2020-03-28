//
//  VideoGameViewController.swift
//  IndividualApp
//
//  Created by Rendong Zhang on 3/28/20.
//  Copyright © 2020 Rendong Zhang. All rights reserved.
//

import UIKit

class VideoGameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //hardcode initialize 
    var vg = [["A","200"],["B","100000"],["C","3"],["D","9978"]]
    override func viewDidLoad() {
        super.viewDidLoad()

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
        vc.getNumPlayers = vg[indexPath.row][1]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObj = vg[sourceIndexPath.item]
        vg.remove(at: sourceIndexPath.item)
        vg.insert(movedObj, at: destinationIndexPath.item)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            vg.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        if isEditing {
            sender.title = "Done"
            // turn off editing mode
            setEditing(false, animated: true)
        } else {
            sender.title = "Edit"
            // ender editing mode
            setEditing(true, animated: true)
        }
        
    }
}

