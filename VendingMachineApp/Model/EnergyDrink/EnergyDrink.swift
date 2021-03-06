//
//  EnergyDrink.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class EnergyDrink : Beverage {
    
    private let caffeine : Int
    
    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date , caffeine : Int){
        self.caffeine = caffeine
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt)
    }
    
    required init() {
        self.caffeine = 0
        super.init()
    }
    required init?(coder: NSCoder) {
        self.caffeine = coder.decodeInteger(forKey: "EnergyDrinkcaffeine")
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(caffeine, forKey: "EnergyDrinkcaffeine")
        super.encode(with: coder)
    }
}
