//
//  DetailViewController.swift
//  iosFinal
//
//  Created by Daria Czerniakiewicz on 3/16/26.
//

import UIKit


class DetailViewController: UIViewController {
    var s:song?
    @IBOutlet weak var descTxtView: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var complicated: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let w = s{
            titleLabel.text = w.name;
            descTxtView.text = "Long: \(w.long)"
            complicated.text = "Lat:  \(w.lat)"
        }
        switch s?.type {
        case .rap :
            image.image = (UIImage(named: "cheif"))
        case .pop :
            image.image = (UIImage(named: "katy"))
        case .rock :
            image.image = (UIImage(named: "rock"))
        case .podcast :
            image.image = (UIImage(named: "podcsy"))
        default:
            image.image = (UIImage(named: "cheif"))        }
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
