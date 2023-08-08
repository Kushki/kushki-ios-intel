//
//  SensoryBrandingController.swift
//  kushki-ios_Example
//
//  Created by Brahian Stiven Zapata Nuñez on 13/06/23.
//  Copyright © 2023 Kushki. All rights reserved.
//
import UIKit
import Kushki

class SensoryBrandingController: UIViewController {
    
    var kushki = Kushki(publicMerchantId: "10000001641125237535111218",
                        currency: "USD",
                        environment: KushkiEnvironment.testing)
    
    
    @IBAction func handleTouchUpInside(_ sender: Any) {
        
        kushki.initVisaBrandingAnimation(uiViewController: self){
            result, err in
            
            print("sensoryBranding animate result: \(result)")
            if let _ = err {
                print("Error: \(err!)")
            }
        }
    }
}
