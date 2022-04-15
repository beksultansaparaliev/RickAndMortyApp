//
//  CharacterCell.swift
//  RickAndMortyApp
//
//  Created by Masaie on 10/4/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    @IBOutlet var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFit
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    @IBOutlet var imageIndicator: UIActivityIndicatorView! {
        didSet {
            imageIndicator.startAnimating()
            imageIndicator.hidesWhenStopped = true
        }
    }
    
    //MARK: - Public Methods
    func configure(with character: Character?) {
        nameLabel.text = character?.name
        nameLabel.text = character?.name
        speciesLabel.text = character?.species
        genderLabel.text = character?.gender
        NetworkManager.shared.fetchImage(from: character?.image) { imageData in
            self.characterImageView.image = UIImage(data: imageData)
            self.imageIndicator.stopAnimating()
        }
    }
}
