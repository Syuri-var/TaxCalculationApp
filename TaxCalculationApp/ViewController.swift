//
//  ViewController.swift
//  TaxCalculationApp
//
//  Created by Apple on 2023/09/04.
//
import UIKit

class viewController: UIViewController {
 
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    
    
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
        // UITextFieldからテキストを取得し、計算を行い、結果を表示する
        if let text = textField.text, let amount = Double(text) {
            let selectedIndex = segmentedControl.selectedSegmentIndex
            let selectedRate = taxRates[selectedIndex]

            // 消費税を計算
            let tax = amount * selectedRate

            // 合計金額を計算
            let totalPrice = amount + tax

            // 結果を表示用のラベルに表示
            Label.text = "消費税: \(tax) 円\n合計: \(totalPrice) 円"
        } else {
            // テキストが数値に変換できない場合のエラーハンドリング
            Label.text = "有効な金額を入力してください"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
