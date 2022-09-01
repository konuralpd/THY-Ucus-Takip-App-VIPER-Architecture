//
//  AnasayfaRouter.swift
//  FlightPlanning
//
//  Created by Asilcan Çetinkaya on 30.08.2022.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: anaEkranVC) {
        let presenter = AnasayfaPresenter()
        ref.anaSayfaPresenterNesnesi = presenter
        ref.anaSayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anaSayfaPresenterNesnesi?.anasayfaView = ref
        ref.anaSayfaPresenterNesnesi?.anasayfaInteractor?.anaSayfaPresenter = presenter
        
    }
    
    
}
