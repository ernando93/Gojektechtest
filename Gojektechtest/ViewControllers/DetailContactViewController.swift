//
//  DetailContactViewController.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 14/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class DetailContactViewController: UIViewController {

    var contact: Contact?
    @IBOutlet weak var tableView: UITableView!
    
    var labelLoading = UILabel()
    var spinner = UIActivityIndicatorView()
    
    var contactId: Int = 0
    
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
        
        tableView.setLoadingScreen(with: spinner, loadingLabel: labelLoading, viewController: self)
        requestDetailContact(with: contactId)
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

//MARK: - Request
extension DetailContactViewController {
    func requestDetailContact(with id: Int) {
        
        Contact.getDetails(withId: id) { result in
            
            switch result {
                
            case .success(let response):
                
                self.contact = response
                self.tableView.removeLoadingScreen(with: self.spinner, loadingLabel: self.labelLoading)
                self.tableView.reloadData()
            case .failure(let error):
                
                self.tableView.removeLoadingScreen(with: self.spinner, loadingLabel: self.labelLoading)
                print(error)
            }
        }
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
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? DetailHeaderTableViewCell
            
            cell?.separatorInset = .zero
            if contact != nil {
                
                cell?.configureCell(with: contact!)
            }
            
            return cell ?? UITableViewCell()
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCells", for: indexPath) as? DetailContactTableViewCell
            
            if contact != nil {
                
                cell?.configureCell(with: contact!, row: indexPath.row)
            }
            
            return cell ?? UITableViewCell()
        }
    }
}

//MARK: - Action
extension DetailContactViewController {
    
    @IBAction func buttonEditTapped(_ sender: UIButton) {
        
        if contact != nil {
            
            performSegue(withIdentifier: "EditContactVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let editVc = segue.destination as? EditContactViewController
        editVc?.contact = contact
    }
}
