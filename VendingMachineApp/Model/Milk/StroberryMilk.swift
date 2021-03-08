//
//  StroberryMilk.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation
import UIKit

class StroberryMilk : Milk {
    private let stroberryContent : Float
    
    init(brand: String, capacity: Int, price: Int, name: String, createdAt: String, expiredAt: String, image : UIImage?,  lowFat : Bool, content : Float){
        self.stroberryContent = content
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   image: UIImage(named: "stroberryMilk"),
                   lowFat: lowFat)
        
    }
    
    convenience init(createdAt : String, expiredAt : String) {
        self.init(brand: "서울우유",
                   capacity: 200,
                   price: 900,
                   name: "딸기맛 우유",
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   image: UIImage(named: "stroberryMilk"),
                   lowFat : false,
                   content : 1.0)
    }
    
    override var description: String {
        return super.description + ", (\(stroberryContent)%)"
    }
}
