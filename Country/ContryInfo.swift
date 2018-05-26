//
//  ContryInfo.swift
//  Country
//
//  Created by user139556 on 5/26/18.
//  Copyright © 2018 user139556. All rights reserved.
//

import Foundation

struct Countryinfo:Decodable {
    
    let name       : String
    var capital    : String
    let flag       : String
    let region     : String
    let population : Int
    
}
