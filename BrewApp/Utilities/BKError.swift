//
//  BKError.swift
//  BrewApp
//
//  Created by Batuhan Kocak on 15.08.2022.
//

import Foundation


enum BKError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Plase try again later."
    case invalidData = "The data recieved from the server was invalid. Please try again."
}
