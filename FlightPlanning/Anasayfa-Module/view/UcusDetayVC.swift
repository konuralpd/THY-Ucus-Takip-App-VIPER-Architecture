//
//  UcusDetayVC.swift
//  FlightPlanning
//
//  Created by Asilcan Çetinkaya on 30.08.2022.
//

import UIKit

class UcusDetayVC: UIViewController {
    
    var filtreliUcuslar = [UcusModel]()
    var ucuslar: UcusModel?
    
    
    @IBOutlet weak var ucusDetayTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ucusDetayTableView.delegate = self
        ucusDetayTableView.dataSource = self
        
    }
    

    
}

extension UcusDetayVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtreliUcuslar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ucus = filtreliUcuslar[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ucusHucre", for: indexPath) as! UcusDetayCell
        cell.gidilecekAlanLabel.text = ucus.gidilecekAlan
        cell.kabinAmiriLabel.text = ucus.kabinAmiri
        cell.ucusTuruLabel.text = "\(ucus.ucusTuru)"
        return cell
    }
    
    
}
