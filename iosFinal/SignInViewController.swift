//
//  SignInViewController.swift
//  iosFinal
//
//  Created by Daria Czerniakiewicz on 3/15/26.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signInPressed(_ sender: Any) {
        if
            let uname = txtUserName.text,
            let pss = txtPass.text{
            if usersDict[uname] == pss { performSegue(withIdentifier: "gotoShazam", sender: self)
            }else{
                let alert = UIAlertController(title: "login Failed", message: "wrong username or pass", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        }
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
