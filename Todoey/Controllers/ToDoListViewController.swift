//
//  ViewController.swift
//  Todoey
//
//  Created by Adin Greenfield on 1/18/19.
//  Copyright © 2019 Adin Greenfield. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController, AddItemDelegate {
   
    
    var itemArray = [Item]()
    
    
    
    var defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.separatorStyle = .none
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
            itemArray = items
        }
        else {
            for i in 1...10 {
                let item = Item()
                item.name = "test" + String(i)
                itemArray.append(item)
            }
        }
        
    }
    
    func userAddedNewItem(item: String) {
        let newItem = Item()
        
        newItem.name = item
        
        itemArray.append(newItem)
        
        defaults.set(itemArray, forKey: "TodoListArray")

        self.tableView.reloadData()
    }
    
    //MARK: - TableView Datasource Methods
    
    //TODO: add function for tableView to know how many rows are needed
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //TODO: add function for tableView to determine how what to display at each row index
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        cell.accessoryType = item.marked ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        itemArray[indexPath.row].marked = !itemArray[indexPath.row].marked
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAddItem" {
            
            let addItemVC = segue.destination as! AddItemViewController
            
            addItemVC.delegate = self
            
        }
    }

    
}

