//
//  SensoryBrandingMCController.swift
//  kushki-ios_Example
//
//  Created by Misael Delgado on 22/08/23.
//  Copyright © 2023 Kushki. All rights reserved.
//
import UIKit
import Kushki

class SensoryBrandingMCController: UIViewController {
    
    var kushki = Kushki(publicMerchantId: "10000001641125237535111218",
                        currency: "USD",
                        environment: KushkiEnvironment.testing)
    
    
    @IBAction func handleTouchUpInside(_ sender: Any) {
        
        kushki.initMastercardBrandingAnimation(uiViewController: self){
            result, err in

            print("mastercard animate result: \(result)")
            if let _ = err {
                print("Error: \(err!)")
            }
        }
    }
}
