//
//  Movie.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 26/01/24.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
}
