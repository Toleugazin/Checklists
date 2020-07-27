//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Olzhas Toleugazin on 7/22/20.
//  Copyright © 2020 Olzhas Toleugazin. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items = [ChecklistsItem]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tableView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
       
        
        
    
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item1 = ChecklistsItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        
        
        let item2 = ChecklistsItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)

        let item3 = ChecklistsItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)

        let item4 = ChecklistsItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = ChecklistsItem()
        item5.text = "Eat ice cream"
        items.append(item5)
        
       

 
    }

 
    
    
    func configureText(for cell: UITableViewCell, with item: ChecklistsItem){
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckmark(for cell: UITableViewCell,with item: ChecklistsItem) {
       
        if item.checked {
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
            
            let item = items[indexPath.row]
            
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
            
    }
           
       
         
           
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)

        }
        
    tableView.deselectRow(at: indexPath, animated: true)
    }
  
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    @IBAction func addItem() {
        
        
        let newRowIndex = items.count
        
        let item = ChecklistsItem()
        item.text = "I am a new row"
        item.checked = true
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    

}
