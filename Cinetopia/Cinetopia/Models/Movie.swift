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

let movies: [Movie] = [
    Movie(id: 1, title: "A Vida Secreta de Walter Mitty", image: "VidaSecretaWalterMitty", synopsis: "Walter Mitty desenvolve fotos para uma revista, mas foge do tédio através de devaneios heroicos. Quando Walter recebe uma chance para uma verdadeira aventura, ele tem a chance de construir um relacionamento com uma colega de trabalho chamada Cheryl.", rate: 7.3, releaseDate: "20/12/2013"),
    Movie(id: 2, title: "Guerra Mundial Z", image: "WorldWarZ", synopsis: "Um vírus letal se espalha rapidamente e transforma seres humanos em zumbis. O ex-agente da ONU Gerry Lane é chamado para investigar a epidemia que está acabando com a humanidade, iniciando uma verdadeira corrida contra o tempo.", rate: 7.0, releaseDate: "28/06/2013"),
    Movie(id: 3, title: "Homem de Ferro", image: "IronMan1", synopsis: "Tony Stark é um industrial bilionário e inventor brilhante que realiza testes bélicos no exterior, mas é sequestrado por terroristas que o forçam a construir uma arma devastadora. Em vez disso, ele constrói uma armadura blindada e enfrenta seus sequestradores. Quando volta aos Estados Unidos, Stark aprimora a armadura e a utiliza para combater o crime.", rate: 7.9, releaseDate: "30/04/2008"),
]
