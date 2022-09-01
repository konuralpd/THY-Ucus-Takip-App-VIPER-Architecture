//
//  UcusEkleRouter.swift
//  FlightPlanning
//
//  Created by Asilcan Çetinkaya on 30.08.2022.
//

import Foundation

class UcusEkleRouter : PresenterToRouterUcusEkleProtocol {
    
    static func createModule(ref: ucusEkleVC) {
        ref.ucusEklePresenterNesnesi = UcusEklePresenter()
        ref.ucusEklePresenterNesnesi?.ucusEkleInteractor = ucusEkleInteractor()
    }
    
    
}
