//
//  SensoryBrandingVisaController.swift
//  kushki
//
//  Created by Brahian Stiven Zapata Nuñez on 13/06/23.
//

import UIKit
import VisaSensoryBranding

class SensoryBrandingVisaController: UIViewController {
    
    let animContainer = UIView()
    var isPlaying = false
    let sensoryBranding: SensoryBranding = SensoryBranding()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func executeAnimationVisa(uiViewController: UIViewController, completion: @escaping (Bool, Error?) -> Void) {
       self.setupAnimContainer(uiViewController: uiViewController)
                                
       let targetWidth = Int.max
               
       if (!isPlaying) {
           isPlaying = true
                       
           // Config all sensoryBranding fields with params
           sensoryBranding.backdropColor = .white
           sensoryBranding.languageCode = "en"
           sensoryBranding.isSoundEnabled = true
           sensoryBranding.checkmarkMode = .checkmark
           
           self.navigationController?
               .setNavigationBarHidden(true, animated: false)
           sensoryBranding.layer.borderWidth = 0 // .removeExternalBorders()
           animContainer.backgroundColor = sensoryBranding.backdropColor
           
           sensoryBranding.translatesAutoresizingMaskIntoConstraints = false
           sensoryBranding.widthAnchor.constraint(equalToConstant: CGFloat(targetWidth)).isActive = true
           sensoryBranding.heightAnchor.constraint(equalToConstant: CGFloat(targetWidth) * 0.32).isActive = true

           animContainer.isHidden = false
           
           // Trigger the animation after the size change is done
           
           sensoryBranding.animate {
               result, err in
               
               self.isPlaying = false
               self.navigationController?
                   .setNavigationBarHidden(false, animated: false)
               self.animContainer.isHidden = true
               DispatchQueue.main.async {
                  completion(result, err)
              }
           }
       }
    }
    
    
    public func setupAnimContainer(uiViewController: UIViewController) {
        uiViewController.view.addSubview(animContainer)
        
        animContainer.translatesAutoresizingMaskIntoConstraints = false
        
        // Setting constraints using NSLayoutConstraint
        NSLayoutConstraint.activate([
            animContainer.topAnchor.constraint(equalTo: uiViewController.view.topAnchor),
            animContainer.leadingAnchor.constraint(equalTo: uiViewController.view.leadingAnchor),
            animContainer.trailingAnchor.constraint(equalTo: uiViewController.view.trailingAnchor),
            animContainer.bottomAnchor.constraint(equalTo: uiViewController.view.bottomAnchor)
        ])
        
        animContainer.backgroundColor = .white
        animContainer.isHidden = true
        
        animContainer.addSubview(sensoryBranding)
        sensoryBranding.layer.borderColor = UIColor.darkGray.cgColor
       
        sensoryBranding.translatesAutoresizingMaskIntoConstraints = false
        sensoryBranding.centerXAnchor.constraint(equalTo: animContainer.centerXAnchor).isActive = true
        sensoryBranding.centerYAnchor.constraint(equalTo: animContainer.centerYAnchor).isActive = true

        let targetWidth: CGFloat = 200
        sensoryBranding.widthAnchor.constraint(equalToConstant: targetWidth).isActive = true
        sensoryBranding.heightAnchor.constraint(equalToConstant: targetWidth * 0.32).isActive = true

    }
}

