//
//  SettingsViewController.swift
//  SideMenu
//
//  Created by Engy on 11/6/24.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    

    let titleNames = ["Profile", "Edit Profile", "Support", "Setting"]
    let images = ["profile", "editProfile", "support", "setting"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - TableView DataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Reuse cell with identifier "SettingsCell"
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = titleNames[indexPath.row]
//        cell.imageView?.image = UIImage(named: images[indexPath.row])
        return cell
    }

}
