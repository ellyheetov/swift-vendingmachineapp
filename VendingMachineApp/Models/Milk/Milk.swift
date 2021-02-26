//
//  Mink.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Milk : Beverage {
    
    private let expire : Date
    
    init(brand : String, capacity : Int, price : Int, name : String, create : String, expire : String){
        
        self.expire = expire.toDate()
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   create: create)
    }
    override var description: String {
        return super.description + ", \(expire.toString())"
    }
    //유통기한 확인
    func checkExpiredate(with date:Date) -> Bool {
        let calendar = Calendar.current
        return calendar.compare(date, to: expire, toGranularity: .day) == .orderedAscending
    }
}
