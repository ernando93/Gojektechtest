//
//  DetailContactViewController.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 14/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class DetailContactViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
}

//MARK: - Setup View
extension DetailContactViewController {
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
extension DetailContactViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return 275.0
        } else {
            
            return 50.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? DetailHeaderTableViewCell
            
            cell?.separatorInset = .zero
            cell?.configureCell()
            
            return cell ?? UITableViewCell()
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "mobileCell", for: indexPath) as? DetailMobileTableViewCell
            
            cell?.configureCell()
            
            return cell ?? UITableViewCell()
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath) as? DetailEmailTableViewCell
            
            cell?.configureCell()
            
            return cell ?? UITableViewCell()
        default:
            
            return UITableViewCell()
        }
    }
}
