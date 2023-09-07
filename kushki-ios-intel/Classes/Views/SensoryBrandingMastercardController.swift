//
//  SensoryBrandingMastercardController.swift
//  kushki
//
//  Created by Misael Delgado on 22/08/23.
//

import UIKit
import MastercardSonic

class SensoryBrandingMastercardController: UIViewController {
    
    private let sonicManager: MCSonicController = MCSonicController()
    private let mcSonicView: MCSonicView = MCSonicView()

    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func executeAnimationMastercard(uiViewController: UIViewController, completion: @escaping (Bool, Error?) -> Void) {
       self.setupAnimContainer(uiViewController: uiViewController)
                            
        if(!sonicManager.isPlaying) {
            mcSonicView.isHidden = false
            sonicManager.play(with: self.mcSonicView, completion: { (status) in
                print("Status = \(status.rawValue)")
                self.mcSonicView.isHidden = true
                self.mcSonicView.leadingAnchor.constraint(equalTo: uiViewController.view.leadingAnchor).isActive = false
                self.mcSonicView.trailingAnchor.constraint(equalTo: uiViewController.view.trailingAnchor).isActive = false
                self.mcSonicView.topAnchor.constraint(equalTo: uiViewController.view.topAnchor).isActive = false
                self.mcSonicView.bottomAnchor.constraint(equalTo: uiViewController.view.bottomAnchor).isActive = false
            })
        }
    }
    

    
    public func setupAnimContainer(uiViewController: UIViewController) {
        uiViewController.view.addSubview(mcSonicView)
        
        mcSonicView.isHidden = true
        mcSonicView.background = MCSonicBackground.white
        mcSonicView.translatesAutoresizingMaskIntoConstraints = false
        mcSonicView.leadingAnchor.constraint(equalTo: uiViewController.view.leadingAnchor).isActive = true
        mcSonicView.trailingAnchor.constraint(equalTo: uiViewController.view.trailingAnchor).isActive = true
        mcSonicView.topAnchor.constraint(equalTo: uiViewController.view.topAnchor).isActive = true
        mcSonicView.bottomAnchor.constraint(equalTo: uiViewController.view.bottomAnchor).isActive = true
        
        let merchant = MCSonicMerchant(
            merchantName: "Kushki",
            countryCode: "EC",
            city: "Quito",
            merchantCategoryCodes: ["fintech"],
            merchantId: nil)

        sonicManager.prepare(with: .soundAndAnimation, sonicCue: "checkout", sonicEnvironment: .sandbox, merchant: merchant!) { status in
            print("Status = \(status.rawValue)")
        }
    
    }
}
