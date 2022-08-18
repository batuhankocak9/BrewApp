//
//  BrewInfo.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 17.08.2022.
//

import Foundation


struct BrewInfo: Codable {
    
    let name: String
    let tagline: String
    let firstBrewed: String
    let abv: Double
    let ibu: Double
    let targetOg: Double
    let description: String
    var imageUrl: String?
    let brewersTips: String
    let contributedBy: String
    
}

