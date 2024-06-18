//
//  FlagsModel.swift
//  FlagJourney
//
//  Created by Filip Gegovski on 19/05/2024.
//

import Foundation
import UIKit

struct FlagsModel {
    let countryName: String
    let capitalCity: String
    let countryFlag: String
    
    var flagImg: UIImage? {
        if let url = URL(string: countryFlag) {
            do {
                let data: Data = try Data(contentsOf: url)
                return UIImage(data: data)!
            } catch {
                return nil
            }
        }
        return nil
    }
}
