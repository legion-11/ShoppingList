//
//  ViewController.swift
//  List
//
//  Created by Dmytro Andriichuk #301132978 on 26.10.2020.
//  Copyright © 2020 legion-11. All rights reserved.
//

import UIKit

// if not written can't be seen in preview
@IBDesignable class DesignableView: UIView {}
@IBDesignable class DesignableButton: UIButton {}

//styling of views
extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}

let DEFAULT_DATA = ["Milk", "Phone", "Diapers", "Beer", "Creativity"]
let CELL_SPACING: CGFloat = 10
class ViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    var items = DEFAULT_DATA
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var listName: UITextField!
    
    //number of rows insections of tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //number of sections of tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    //create  spaccing beetween sections of table
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CELL_SPACING
    }
    
    //mace spacing clear
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    //creating custome cells cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TableViewCell
        cell.name.text = items[indexPath.section]
        return cell
    }
    
    //connecting tableview with viewcontroller
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
)
    }
    // hide keyboard when press on something inside tableview
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        view.endEditing(true)
    }
    //hide keyboard when press on something outside tableview
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // restore inputed item names to default and number to x01
    @IBAction func pressCancel(_ sender: Any) {
        items = DEFAULT_DATA
        listName.text = "New List"
        for cell in tableview.visibleCells as! Array<TableViewCell> {
            cell.number.text = "x01"
            cell.steper.value = 1
        }
        tableview.reloadData()
    }
}
