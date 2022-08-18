//
//  Brew.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 17.08.2022.
//

import Foundation



struct Brew: Codable, Hashable {
    
    let id: Int
    let name: String
    var imageUrl: String?
}
