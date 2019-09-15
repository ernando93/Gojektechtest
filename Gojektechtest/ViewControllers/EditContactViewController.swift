//
//  EditContactViewController.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 14/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class EditContactViewController: UIViewController {

    var contact: Contact?
    @IBOutlet weak var tableView: UITableView!
    
    var labelLoading = UILabel()
    var spinner = UIActivityIndicatorView()
    
    var firstName: String = ""
    var lastName: String = ""
    var phoneNumber: String = ""
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewContent()
    }
}

//MARK: - Setup View
extension EditContactViewController {
    
    func setupViewContent() {
        
        setupTableView(in: tableView)
        firstName = contact?.firstName ?? ""
        lastName = contact?.lastName ?? ""
        phoneNumber = contact?.phoneNumber ?? ""
        email = contact?.email ?? ""
    }
    
    func setupTableView(in tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
    }
}

//MARK: - Request
extension EditContactViewController {
    
    func requestEditContect(id: Int, firstName: String, lastName: String, phone: String, email: String) {
        
        Contact.editDetails(withId: id, withFirstName: firstName, withLastName: lastName, withPhoneNumber: phone, andEmail: email) { result in
            
            switch result {
                
            case .success(let response):
                
                print(response)
                self.tableView.removeLoadingScreen(with: self.spinner, loadingLabel: self.labelLoading)
                self.dismiss(animated: true, completion: nil)
            case .failure(let error):
                
                self.tableView.removeLoadingScreen(with: self.spinner, loadingLabel: self.labelLoading)
                print(error)
            }
        }
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
            cell?.configureCell(with: contact!)
            
            return cell ?? UITableViewCell()
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "editContactCells", for: indexPath) as? EditContactTableViewCell
            
            cell?.configureCell(with: contact!, row: indexPath.row)
            cell?.textField.tag = indexPath.row
            cell?.textField.addTarget(self, action: #selector(textFieldDidChanged(sender:)), for: .editingChanged)
            
            return cell ?? UITableViewCell()
        }
    }
}

//MARK: - TextField Delegate
extension EditContactViewController: UITextFieldDelegate {
    
    @objc func textFieldDidChanged(sender: UITextField) {
        
        switch sender.tag {
            
        case 1:
            
            firstName = sender.text!
        case 2:
            
            lastName = sender.text!
        case 3:
            
            phoneNumber = sender.text!
        case 4:
            
            email = sender.text!
        default:
            
            print("None")
        }
    }
}

//MARK: - Action
extension EditContactViewController {
    
    @IBAction func buttonCancelTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonDoneTapped(_ sender: UIButton) {
        
        if firstName == "" {
            
            self.present(UIAlertController.defaultAlertController(title: "", message: "Fill your first name", textAction: "OK"), animated: true, completion: nil)
        } else if lastName == "" {
            
            self.present(UIAlertController.defaultAlertController(title: "", message: "Fill your last name", textAction: "OK"), animated: true, completion: nil)
        } else if phoneNumber == "" {
            
            self.present(UIAlertController.defaultAlertController(title: "", message: "Fill your mobile", textAction: "OK"), animated: true, completion: nil)
        } else if email == "" {
            
            self.present(UIAlertController.defaultAlertController(title: "", message: "Fill your email", textAction: "OK"), animated: true, completion: nil)
        } else {
            
            if String.isValidEmail(emailString: email) {
                
                requestEditContect(id: contact?.id ?? 0, firstName: firstName, lastName: lastName, phone: phoneNumber, email: email)
            } else {
                
                tableView.setLoadingScreen(with: spinner, loadingLabel: labelLoading, viewController: self)
                self.present(UIAlertController.defaultAlertController(title: "", message: "Email is wrong format", textAction: "OK"), animated: true, completion: nil)
            }
        }
        
    }
}
