//
//  AddItemViewController.swift
//  Todoey
//
//  Created by Adin Greenfield on 1/19/19.
//  Copyright © 2019 Adin Greenfield. All rights reserved.
//

import UIKit

//MARK: - create protocol for AddItem Delegate
protocol AddItemDelegate {
    
    func userAddedNewItem(item: String)
    
}

class AddItemViewController: UIViewController {


    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var itemTextField: UITextField!
    
    var item : String = ""
    
    var delegate : AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.layer.cornerRadius = 20
        addButton.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        let newItem : String = itemTextField.text!
        
        if(itemTextField.text! != ""){
            delegate?.userAddedNewItem(item: newItem)
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
