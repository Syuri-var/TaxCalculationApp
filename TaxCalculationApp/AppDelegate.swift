//
//  AppDelegate.swift
//  TaxCalculationApp
//
//  Created by Apple on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let taxRates: [Double] = [0.08, 0.10]
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        let selectedRate = taxRates[selectedIndex]
        
        // ここで消費税を計算（例えば、100円を想定）
        let price = 100.0
        let tax = price * selectedRate
        let totalPrice = price + tax
        
        Label.text = "消費税: \(tax) 円\n合計: \(totalPrice) 円"
    }
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            calculateAndDisplayTotal()
        }
        func calculateAndDisplayTotal() {
            if let text = textField.text, let amount = Double(text) {
                let selectedIndex = segmentedControl.selectedSegmentIndex
                let selectedRate = taxRates[selectedIndex]
                
                // 消費税を計算
                let tax = amount * selectedRate
                
                // 合計金額を計算
                let totalPrice = amount + tax
                
                // 結果を表示用のラベルに表示
                resultLabel.text = "消費税込み価格: \(totalPrice) 円"
            } else {
                resultLabel.text = "金額を入力してください"
            }
        }
    }
}
