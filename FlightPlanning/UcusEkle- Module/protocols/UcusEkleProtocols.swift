//
//  UcusEkleProtocols.swift
//  FlightPlanning
//
//  Created by Asilcan Çetinkaya on 30.08.2022.
//

import Foundation

protocol ViewToPresenterUcusEkleProtocol {
    
    var ucusEkleInteractor : PresenterToInteractorUcusEkleProtocol? {get set}
    
    
    func ekle(ucusTuru:Int , kabinAmiri:String , gidilecekAlan:String , ucusTarihi:String)
    
}
protocol PresenterToInteractorUcusEkleProtocol {
    
    func yeniEkle(ucusTuru:Int , kabinAmiri:String , gidilecekAlan:String , ucusTarihi:String)
    
}
protocol PresenterToRouterUcusEkleProtocol {
    
    static func createModule(ref: ucusEkleVC)
}

