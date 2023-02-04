//
//  trash_shortcut_ViewController.swift
//  main_todo_list
//
//  Created by kaito on 2023/01/29.
//

import UIKit

class trash_shortcut_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var trash_event_tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(segmentnames)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentnames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trash_event_cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        trash_event_cell.textLabel?.text = segmentnames[indexPath.row]
        
        return trash_event_cell
    }
    
    //セルの消去
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        segmentnames.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
    }

}