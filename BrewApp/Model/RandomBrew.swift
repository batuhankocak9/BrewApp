//
//  RandomBrew.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 15.08.2022.
//

import Foundation

struct RandomBrew: Codable {
    
    let id: Int
    let name: String
    let tagline: String
    let firstBrewed: String
    let abv: Double
    let ibu: Double
    let targetOg: Double
    var imageUrl: String?
}
