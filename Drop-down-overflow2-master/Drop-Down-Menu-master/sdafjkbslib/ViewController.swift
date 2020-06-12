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
    var button = DropDownBtn()
    var topButtonConstraint: NSLayoutConstraint?
    let topButtonConstraintInitialValue: CGFloat = -90.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Configure the button
        tableView.delegate = self
        tableView.dataSource = self
        
        setupButton()
        
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

            //cell.clipsToBounds=false
            //cell.contentView.clipsToBounds=false
            //cell.layer.zPosition = 3
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            return cell
        }
    }
    
    private func setupButton() {
        button = DropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setTitle("Button1", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        //button Constraints
        button.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true
        topButtonConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: button, attribute: .top, multiplier: 1.0, constant: topButtonConstraintInitialValue)
        topButtonConstraint?.isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //Set the drop down menu's options
        button.dropView.dropDownOptions = ["Option1", "Option2", "Option3", "Option4"]
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc
    func didTapButton() {
        print("did Tap button")
        button.toggleState()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        topButtonConstraint?.constant = topButtonConstraintInitialValue + offset
        print("offset = \(offset), topButtonConstraint = \(String(describing: topButtonConstraint?.constant))")
        button.setNeedsLayout()
        //button.layoutIfNeeded()
    }
}
