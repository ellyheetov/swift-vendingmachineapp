//
//  AdminControllerViewController.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/17.
//

import UIKit

class AdminViewController : UIViewController {

    private var vendingMachine : AdminOfVendingMachine!
    private var stockStackView : StockStackView!
    private var closeButton : UIButton = {
        let button = UIButton(type: .close)
        button.addTarget(self, action: #selector(closeButtonTouched), for: .touchDown)
        return button
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageLabel), name: VendingMachine.StockCountChanged, object: vendingMachine)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        vendingMachine = (UIApplication.shared.delegate as! AppDelegate).vendingMachine
        
        // 현재 재고를 보여주는 뷰 초기화
        let stocks = vendingMachine.getTotalStock()
        setUpStockStackView(with : stocks)
        self.view.addSubview(stockStackView)
        stockStackViewConfiguration()
        
        // 닫기 버튼 뷰 초기화
        self.view.addSubview(closeButton)
        closeButton.frame = CGRect(x: view.bounds.maxX - 40, y: view.bounds.minY + 20, width: 20, height: 20)
    }
}

// MARK: - Action
extension AdminViewController {

    @objc func updateBeverageLabel(){
        let dict = vendingMachine.getTotalStock()
        stockStackView.setStocksCount(info: dict)
    }
    @objc func closeButtonTouched(){
        self.dismiss(animated: true)
    }
}

// MARK: - Set up View
extension AdminViewController {
    func setUpStockStackView(with stocks : [ObjectIdentifier: [Beverage]]){
        stockStackView = StockStackView(frame: .zero)
        stockStackView.setItemCountPerStand(count: 4)
        stockStackView.setUp()

        // 재고를 추가하는 버튼 생성과 action을 넣어준다.
        stockStackView.stockCells.forEach{ (oneStock) in
            oneStock.setButton(for: .add)
            oneStock.button.bind(action: UIAction(handler: { (action) in
                guard let beverage = Factory.createInstance(type:oneStock.beverageType) else { return }
                self.vendingMachine.append(product: beverage)
            }))
        }
        stockStackView.setStocksCount(info: stocks)
    }
}

// MARK: - Configuration
extension AdminViewController {
    func stockStackViewConfiguration(){
        stockStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 60).isActive = true
        stockStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        stockStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
        stockStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
