//
//  File.swift
//  RickAndMortyApp
//
//  Created by Masaie on 9/4/22.
//

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let location: Location
    let episode: [String]
    let image: String
}

struct Location: Decodable {
    let name: String
    let url : String
}

struct Episode: Decodable {
    let name: String
}
