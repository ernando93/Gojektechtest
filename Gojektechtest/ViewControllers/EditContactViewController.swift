//
//  EditContactViewController.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 14/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class EditContactViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewContent()
    }
}

//MARK: - Setup View
extension EditContactViewController {
    
    func setupViewContent() {
        
        setupTableView(in: tableView)
    }
    
    func setupTableView(in tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
    }
}

//MARK: - TableView Delegate & DataSource
extension EditContactViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return 190.0
        } else {
            
            return 50.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "editHeaderCell", for: indexPath) as? EditHeaderTableViewCell
            
            cell?.separatorInset = .zero
            cell?.configureCell()
            
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "editContactCells", for: indexPath) as? EditContactTableViewCell
            
            cell?.configureCell(with: indexPath.row)
            
            return cell ?? UITableViewCell()
        }
    }
}

//MARK: - Action
extension EditContactViewController {
    
    @IBAction func buttonCancelTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
}
