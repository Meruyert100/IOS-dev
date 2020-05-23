//
//  MoviesCollectionViewCell.swift
//  MovieNews
//
//  Created by Meruyert Tastandiyeva on 5/21/20.
//  Copyright © 2020 Meruyert Tastandiyeva. All rights reserved.
//

import Foundation

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {

    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fontView: UIView!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var currentMovie: MovieModel?

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview);

        self.backgroundColor = UIColor.white;
        self.layer.cornerRadius = 8.0;
        self.layer.masksToBounds = true;
    }

    func bindData(movie: MovieModel) {
        self.currentMovie = movie;

        self.imageView.image = UIImage(named: "no_image");
        self.name.text = movie.title ?? "";

        if let p = movie.popularity {
            self.popularity.text = String(format: "⭐️ %.02f", p);
        } else {
            self.popularity.text = "";
        }
        
        self.date.text = movie.date ?? "";
    }
}
