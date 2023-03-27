//
//  JwtResponse.swift
//  Kushki
//
//  Created by Marco Moreno on 28/12/20.
//
import Foundation


extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}

public struct JwtResponse {
    public let jwt: String
    public let code: String
    public let message: String
}

public struct KushkiInfo: Codable {
    public let platformId: String
    public let platformVersion: String
    
    init(platformId: String, platformVersion: String) {
        self.platformId = platformId
        self.platformVersion = platformVersion
    }
    
    init() {
        self.platformId = PLATFORMS.IOS.rawValue
        
        let iosCurrentVersion : Bundle? = Bundle(identifier: "org.cocoapods.Kushki")
        
        if(iosCurrentVersion != nil){
            self.platformVersion = iosCurrentVersion!.releaseVersionNumber!
        }else {
            self.platformVersion = ""
        }
    }
    
    func toBase64() -> String{
        var kushkiInfoBase64: String  = ""
        do{
            
            let jsonData = try JSONEncoder().encode(self)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            
            kushkiInfoBase64 = Data(jsonString.utf8).base64EncodedString()
        } catch {
            print(error)
        }
        
        return kushkiInfoBase64
    }
}
