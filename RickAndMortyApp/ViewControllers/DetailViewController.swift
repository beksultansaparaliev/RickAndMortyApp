//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Masaie on 9/4/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = characterImageView.frame.width / 2
        }
    }
    @IBOutlet var imageIndicator: UIActivityIndicatorView! {
        didSet {
            imageIndicator.startAnimating()
            imageIndicator.hidesWhenStopped = true
        }
    }
    
    //MARK: - Public Properties
    var character: Character!
    
    //MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        title = character.name
        descriptionLabel.text = character.description
        
        NetworkManager.shared.fetchImage(from: character.image) { imageData in
            self.characterImageView.image = UIImage(data: imageData)
            self.imageIndicator.stopAnimating()
        }
    }
}


