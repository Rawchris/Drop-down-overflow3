//
//  ViewController.swift
//  sdafjkbslib
//
//  Created by Davidson Family on 11/1/17.
//  Copyright © 2017 Archetapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Configure the button
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return CGFloat(200)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setTableViewCell()
            
            cell.clipsToBounds=false
            cell.contentView.clipsToBounds=false
            cell.layer.zPosition = 3
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            return cell
        }
    }
    
}

