//
//  ViewController.swift
//  QRcodeScanner
//
//  Created by Ольга on 28.04.2022.
//

import UIKit
import SwiftQRScanner

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func scanQRAction(_ sender: Any) {
        //QRCode scanner without Camera switch and Torch
        let scanner = QRCodeScannerController()
        
        //QRCode with Camera switch and Torch
        //let scanner = QRCodeScannerController(cameraImage: UIImage(named: "camera"), cancelImage: UIImage(named: "cancel"), flashOnImage: UIImage(named: "flash-on"), flashOffImage: UIImage(named: "flash-off"))
        scanner.delegate = self
        self.present(scanner, animated: true, completion: nil)
    }
    
}

extension ViewController: QRScannerCodeDelegate {
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
        print("result:\(result)")
        if let url = URL(string: result) {
            UIApplication.shared.open(url)
        }
    }
    
    func qrScannerDidFail(_ controller: UIViewController, error: String) {
        print("error:\(error)")
    }
    
    func qrScannerDidCancel(_ controller: UIViewController) {
        print("SwiftQRScanner did cancel")
    }
}
