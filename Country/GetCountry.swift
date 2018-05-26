//
//  GetCountry.swift
//  Country
//
//  Created by user139556 on 5/26/18.
//  Copyright © 2018 user139556. All rights reserved.
//

import UIKit
import Foundation

class GetCountry: NSObject {
    
     var countries = [Countryinfo]()
    
    func getJSON(completion: @escaping ([Countryinfo]) -> Void) {
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    self.countries = try JSONDecoder().decode([Countryinfo].self, from: data!)
                    DispatchQueue.main.async {
                        completion(self.countries)
                    }
                }catch {
                    print("JSON Error")
                }
            }
            }.resume()
    }
}
