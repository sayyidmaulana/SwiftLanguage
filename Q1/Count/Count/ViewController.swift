//
//  ViewController.swift
//  Count
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var namaKasir: UILabel!
    @IBOutlet weak var nasi: UITextField!
    @IBOutlet weak var lauk: UITextField!
    @IBOutlet weak var minum: UITextField!
    @IBOutlet weak var totalBayar: UILabel!

    @IBOutlet weak var bayarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bayarButton.addTarget(self, action: #selector(self.bayar), for: .touchUpInside)
    }
    
    private func bayarData() {
        let nasiData = Int(self.nasi.text ?? "") ?? 0
        let laukData = Int(self.lauk.text ?? "") ?? 0
        let minumData = Int(self.minum.text ?? "") ?? 0
        
        let total = nasiData + laukData + minumData
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        if let formattedTipAmount = formatter.string(from: total as NSNumber) {
            self.totalBayar.text = "Total yang harus dibayar:\nRp\(formattedTipAmount),00"
        }
    }
    
    @objc func bayar() {
        bayarData()
    }

}

