//
//  HomeViewController.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 14/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var list: [Contact] = []
    @IBOutlet weak var tableView: UITableView!
    
    var labelLoading = UILabel()
    var spinner = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = UIColor(red: 80.0/255.0, green: 227.0/255.0, blue: 194.0/255.0, alpha: 1.0)
        setupViewContent()
        tableView.setLoadingScreen(with: spinner, loadingLabel: labelLoading, viewController: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requestListContact()
    }
}

//MARK: - Setup View
extension HomeViewController {
    
    func setupViewContent() {
        
        setupTableView(in: tableView)
    }
    
    func setupTableView(in tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ListContactTableViewCell", bundle: nil), forCellReuseIdentifier: "listCell")
        
        tableView.tableFooterView = UIView()
    }
}

//MARK: - Request
extension HomeViewController {
    func requestListContact() {
        
        ListContact.getList() { result in
        
            switch result {
                
            case .success(let response):
                
                self.list = response.list
                self.tableView.removeLoadingScreen(with: self.spinner, loadingLabel: self.labelLoading)
                self.tableView.reloadData()
            case .failure(let failed):
                
                print(print(failed.localizedDescription))
            }
        }
    }
}

//MARK: - TableView Delegate & DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListContactTableViewCell
        
        let data = list[indexPath.row]
        cell?.configureCell(with: data)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = list[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "detailVC") as? DetailContactViewController
        vc?.contactId = data.id
        self.navigationController?.pushViewController(vc!, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
