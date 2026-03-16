//
//  RegistrationViewController.swift
//  iosFinal
//
//  Created by Daria Czerniakiewicz on 3/15/26.
//

import UIKit

var usersDict = ["user": "pass"]

class RegistrationViewController: UIViewController {

    @IBOutlet weak var RegUserName: UITextField!
    
    @IBOutlet weak var Regpass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegisterButton(_ sender: Any) {
        if let uname = RegUserName.text,
           let pass = Regpass.text {
            if uname.isEmpty || pass.isEmpty{
                let alert = UIAlertController(title: "registration Failed", message: "empty username or pass", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
            usersDict[uname] = pass
        }else{
            let alert = UIAlertController(title: "registration Failed", message: "bad username or pass", preferredStyle: .alert)
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
