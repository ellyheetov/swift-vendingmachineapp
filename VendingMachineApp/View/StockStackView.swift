//
//  StockStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/09.
//

import UIKit

class StockStackView: UIStackView {
    
    public var itemCountPerStand : Int = 4
    
    var stockCells : [OneStockView]!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        confiure()
        setStockCells()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        confiure()
        setStockCells()
    }

    func setUp(){
        for i in stride(from: 0, to: stockCells.count , by: itemCountPerStand){
            let stackview = UIStackView()
            
            stackview.axis = .horizontal
            stackview.distribution = .fillEqually
            stackview.spacing = 5
            stackview.translatesAutoresizingMaskIntoConstraints = false
            
            for view in stockCells[i..<min(i+itemCountPerStand, stockCells.count)] {
                stackview.addArrangedSubview(view)
            }
            self.addArrangedSubview(stackview)
        }
    }
    
    func setStockCells(){
        stockCells = [OneStockView]()
        
        ImageManager.types.forEach{ currentType in
            let stock : OneStockView = {
                let stockview = OneStockView(frame: CGRect(x: 0, y: 0, width: 180, height: 240))
                stockview.beverageType = currentType
                stockview.stockImageView.image = ImageManager.getImage(type: currentType.self)
                stockview.addButton.setType(with: currentType)
                stockview.buyButton.setType(with: currentType)
                return stockview
            }()
            stockCells.append(stock)
        }
    }
    
    func setStocksCount(info dict : [ObjectIdentifier: [Beverage]]){
        stockCells.forEach{ stock in
            let value =  dict[ObjectIdentifier(stock.beverageType)]?.count ?? 0
            stock.reloadLabelText(count: value)
        }
    }
    func confiure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 20
    }
    
}
