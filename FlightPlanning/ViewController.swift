//
//  ViewController.swift
//  FlightPlanning
//
//  Created by Asilcan Çetinkaya on 29.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var thyStarImage: UIImageView!
    @IBOutlet weak var idNumaraTxf: UITextField!
    @IBOutlet weak var sifreTxf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func butonGirisYap(_ sender: Any) {
        performSegue(withIdentifier: "toAnaEkranVC", sender: nil)
    }
    
}

