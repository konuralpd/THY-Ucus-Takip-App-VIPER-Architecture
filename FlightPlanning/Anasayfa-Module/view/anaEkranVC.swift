//
//  anaEkranVC.swift
//  FlightPlanning
//
//  Created by Asilcan Çetinkaya on 30.08.2022.
//

import UIKit

class anaEkranVC: UIViewController {
    
    var anaSayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    var ucusListesi = [UcusModel]()
    var filtreliArray = [UcusModel]()
    
    
    @IBOutlet weak var thyMiniLogo: UIImageView!
    
    @IBOutlet weak var anaEkranView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AnasayfaRouter.createModule(ref: self)
        veritabaniKopyalama()
        

        
    }
    override func viewWillAppear(_ animated: Bool) {
        anaSayfaPresenterNesnesi?.verileriGetir()
        
    }
    func veritabaniKopyalama(){
        
        let bundleYolu = Bundle.main.path(forResource: "UcusBilgi", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("UcusBilgi.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUcuslarVC" {
            let ucuslar = sender as? UcusModel
            let destinationVC = segue.destination as! UcusDetayVC
            destinationVC.ucuslar = ucuslar
            
        }
        
        
    }
    @IBAction func butonPlanlananUcus(_ sender: Any) {
        
     let filtrelenmisUcuslar = anaSayfaPresenterNesnesi?.anasayfaInteractor?.filtrele(ucusTuru: 0)
        
        performSegue(withIdentifier: "toUcuslarVC", sender: filtrelenmisUcuslar)
        
    
    }
        
    @IBAction func butonRezervUcus(_ sender: Any) {
        let filtrelenmisUcuslar = anaSayfaPresenterNesnesi?.anasayfaInteractor?.filtrele(ucusTuru: 1)
           performSegue(withIdentifier: "toUcuslarVC", sender: filtrelenmisUcuslar)
    }
    
    
    @IBAction func butonAirportStanby(_ sender: Any) {
        let filtrelenmisUcuslar = anaSayfaPresenterNesnesi?.anasayfaInteractor?.filtrele(ucusTuru: 2)
           performSegue(withIdentifier: "toUcuslarVC", sender: filtrelenmisUcuslar)
    }
    
    @IBAction func butonHomeStandby(_ sender: Any) {
        let filtrelenmisUcuslar = anaSayfaPresenterNesnesi?.anasayfaInteractor?.filtrele(ucusTuru: 3)
           performSegue(withIdentifier: "toUcuslarVC", sender: filtrelenmisUcuslar)
    }
    
   
    
}

extension anaEkranVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(UcusBilgisi: Array<UcusModel>) {
        self.ucusListesi = UcusBilgisi
        
    }
    
    
}
