//
//  ViewController.swift
//  FreshNews
//
//  Created by MACBOOKAIR on 27/8/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtPassword.isSecureTextEntry = true
        btnLogin.layer.cornerRadius=25.0
    }
    func showAlert(){
        let alert = UIAlertController(title: "Login", message: "Failed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {
            action in
            print("tapped dismmis")
        }))
        present(alert, animated: true)
    }
    func showActionsheet(){
        
    }
    
    
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        if(txtName.text == "karona" && txtPassword.text == "123"){
            let homeviewcontroler = storyboard?.instantiateViewController(identifier: "Home_vc") as! HomeviewController
            present(homeviewcontroler, animated: true)
        }
        else{
            showAlert()
        }
        
    }

}
