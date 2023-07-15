//
//  MovieResponse.swift
//  CinemaApp
//
//  Created by Diana Pava Avila on 15/07/23.
//

import Foundation

struct MovieResponse<T: Codable>: Codable {
    let results : [T]
}
