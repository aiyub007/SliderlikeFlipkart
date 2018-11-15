//
//  ViewController.swift
//  tableViewCheckD
//
//  Created by Aiyub on 10/31/18.
//  Copyright © 2018 Self. All rights reserved.
//

import UIKit
class ViewController: UIViewController
{
    var baseView = AMOrderTrackerForUITableView()
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.baseView.strip_color = .gray
        self.baseView.setView(tblView: self.tblView, selected_indexForAnimation : 3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITableViewDataSource , UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "          Aiyub is Checking\(indexPath.row+1)"
        return cell
    }
}
