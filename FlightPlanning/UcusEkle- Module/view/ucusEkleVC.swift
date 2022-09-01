//
//  ucusEkleVC.swift
//  FlightPlanning
//
//  Created by Asilcan Çetinkaya on 30.08.2022.
//

import UIKit

class ucusEkleVC: UIViewController {
    
    var ucusEklePresenterNesnesi : ViewToPresenterUcusEkleProtocol?
    
    @IBOutlet weak var ucusTuruSegmented: UISegmentedControl!
    
    
    @IBOutlet weak var kabinAmiriTxf: UITextField!
    
    @IBOutlet weak var gidilecekAlanTxf: UITextField!
    
    @IBOutlet weak var ucusTarihiTxf: UITextField!
    
    var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        datePicker = UIDatePicker()
                datePicker?.datePickerMode = .date
                ucusTarihiTxf.inputView = datePicker

        UcusEkleRouter.createModule(ref: self)
                if #available(iOS 13.4, *) {
                    datePicker?.preferredDatePickerStyle = .wheels
                    
                    

                }
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
                view.addGestureRecognizer(dokunmaAlgilama)

                datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker:)), for: .valueChanged)
    
    }
    
    @objc func tarihGoster(uiDatePicker: UIDatePicker) {
            let tarihFormat = DateFormatter()
            tarihFormat.dateFormat = "MM/dd/yyyy"
            let alinanTarih = tarihFormat.string(from: uiDatePicker.date)
            ucusTarihiTxf.text = alinanTarih
        
    }
    
    @objc func dokunmaAlgilamaMetod() {
            view.endEditing(true)
        
    }
    
    @IBAction func ucusSegmentedControl(_ sender: UISegmentedControl) {
        let secilenIndeks = sender.selectedSegmentIndex
                let secilenBaslik = sender.titleForSegment(at: secilenIndeks)!
    }
    
    @IBAction func ucusEkleButon(_ sender: Any) {
        
        if let katf = kabinAmiriTxf.text, let gatf = gidilecekAlanTxf.text, let utt = ucusTarihiTxf.text, let uct = ucusTuruSegmented?.selectedSegmentIndex {
            ucusEklePresenterNesnesi?.ekle(ucusTuru: uct, kabinAmiri: katf, gidilecekAlan: gatf, ucusTarihi: utt)
            
            self.navigationController?.popToRootViewController(animated: true)
           
        
    }

   }
    
}
