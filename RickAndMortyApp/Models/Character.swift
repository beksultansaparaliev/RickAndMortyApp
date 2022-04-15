//
//  File.swift
//  RickAndMortyApp
//
//  Created by Masaie on 9/4/22.
//

struct RickAndMorty: Decodable {
    let info: Info
    let results: [Character]
}

struct Info: Decodable {
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: Location
    let image: String
    let episode: [String]
    
    var description: String {
    """
    Name: \(name)
    Species: \(species)
    Status: \(status)
    Location: \(location.name)
    Number of episodes: \(episode.count)
    """
    }
}

struct Location: Decodable {
    let name: String
}

enum Link: String {
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}
