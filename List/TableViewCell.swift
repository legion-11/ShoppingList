//
//  TableViewCell.swift
//  List
//
//  Created by legion-11 on 29.10.2020.
//  Copyright © 2020 legion-11. All rights reserved.
//

import UIKit
//custome label for tableview
class TableViewCell: UITableViewCell{
    
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var number: UILabel!
    
    //change number label
    @IBAction func SteperPressed(_ sender: UIStepper) {
        number.text = String(format:"x%02d",Int(sender.value))
    }
}
