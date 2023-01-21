//
//  ViewController.swift
//  main_todo_list
//
//  Created by kaito on 2023/01/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource{
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo_list.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        TodoCell.textLabel?.text = todo_list[indexPath.row]
        
        //更新
        let newIndex = todo_list.count
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
        
        return TodoCell
    }
}

