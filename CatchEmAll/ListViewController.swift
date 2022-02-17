//
//  ListViewController.swift
//  CatchEmAll
//
//  Created by Jordan Garcia on 2/14/22.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var creatures = Creatures()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        creatures.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
}
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.creatureArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\(indexPath.row + 1) of \(creatures.creatureArray.count)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row == creatures.creatureArray.count-1 && creatures.urlString.hasPrefix("http") {
            creatures.getData {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        cell.textLabel?.text = "\(indexPath.row+1).\(creatures.creatureArray[indexPath.row].name)"
        return cell
    }
}
