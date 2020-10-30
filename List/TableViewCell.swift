//
//  TableViewCell.swift
//  List
//
//  Created by legion-11 on 29.10.2020.
//  Copyright © 2020 legion-11. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var number: UILabel!

    @IBAction func SteperPressed(_ sender: UIStepper) {
        number.text = String(format:"x%02d",Int(sender.value))
    }
}
