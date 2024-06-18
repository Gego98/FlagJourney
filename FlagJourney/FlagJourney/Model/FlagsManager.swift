//
//  FlagsManager.swift
//  FlagJourney
//
//  Created by Filip Gegovski on 12/05/2024.
//

import Foundation
import UIKit

struct FlagsManager {
    let flagsURL = "https://restcountries.com/v3.1/name/"
    
    func fetchFlags(countryName: String) {
        let urlString = flagsURL + countryName
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, resonse, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let flags = self.parseJSON(flagsData: safeData) {
                        let flagsVC = ViewController()
                        flagsVC.didUpdateFlags(flags: flags)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(flagsData: Data) -> FlagsModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([FlagsData].self, from: flagsData)
            let name = decodedData.first!.name.common
            let city = decodedData.first!.capital[0]
            let flag = decodedData.first!.flags.png
            
            let flags = FlagsModel(countryName: name, capitalCity: city, countryFlag: flag)
            return flags
        } catch {
            print(error)
            return nil
        }
    }
}
