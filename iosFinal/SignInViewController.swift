//
//  SignInViewController.swift
//  iosFinal
//
//  Created by Daria Czerniakiewicz on 3/15/26.
//

import UIKit
import CoreData

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signInPressed(_ sender: Any) {
        
        guard  let uname = txtUserName.text,
               let pss = txtPass.text,
               !uname.isEmpty,
               !pss.isEmpty
        else{return}
        //            if usersDict[uname] == pss { performSegue(withIdentifier: "gotoShazam", sender: self)
        //            }else{
        //                let alert = UIAlertController(title: "login Failed", message: "wrong username or pass", preferredStyle: .alert)
        //                alert.addAction(UIAlertAction(title: "OK", style: .default))
        //                present(alert, animated: true)
        //            }
        //        }
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request : NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@ AND password == %@", uname, pss)
        
        do{
            let results = try context.fetch(request)
            if results.count > 0 {
                performSegue(withIdentifier: "gotoShazam", sender: self)
            }else {
                let alert = UIAlertController(title: "login Failed", message: "wrong username or pass", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        }catch {
            print( "fetch failed")
            
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
