//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Masaie on 9/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusAndSpeciesLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Не получилось вынести код в Нетворк менеджер
//        NetworkManager.shared.fetchCharacter()
        fetchCharacter()
    }
    
    func fetchCharacter() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/808") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let character = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    self.nameLabel.text = character.name
                    self.statusAndSpeciesLabel.text = "\(character.status) - \(character.species)"
                    self.locationLabel.text = character.location.name
                    self.episodeLabel.text = character.episode.first
                    
                    //MARK: - Fetch Episode Name
                    guard let url = URL(string: character.episode.first ?? "") else { return }
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        guard let data = data else {
                            print(error?.localizedDescription ?? "No error description")
                            return
                        }
                        do {
                            let episode = try JSONDecoder().decode(Episode.self, from: data)
                            DispatchQueue.main.async {
                                self.episodeLabel.text = episode.name
                            }
                        } catch let error {
                            print(error)
                        }
                    }.resume()
                    
                    //MARK: - Fetch Image
                    guard let url = URL(string: character.image) else { return }
                    URLSession.shared.dataTask(with: url) { data, _, error in
                        guard let data = data else {
                            print(error?.localizedDescription ?? "No error description")
                            return
                        }
                        DispatchQueue.main.async {
                            self.image.image = UIImage(data: data)
                        }
                    }.resume()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

