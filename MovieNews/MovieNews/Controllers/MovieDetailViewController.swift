//
//  MovieDetailViewController.swift
//  MovieNews
//
//  Created by Meruyert Tastandiyeva on 5/21/20.
//  Copyright © 2020 Meruyert Tastandiyeva. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var currentMovie: MovieModel?;
    var dataSource: DataSource?;

    override func viewDidLoad() {
        super.viewDidLoad();

        self.view.backgroundColor = UIColor.backgroundColor;

        if let movie = self.currentMovie {
            showMovie(movie: movie);
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();

    }

    fileprivate func showMovie(movie: MovieModel) {
        self.title = movie.title;

        if let path = movie.imageUrl {
            dataSource?.fetchMoviePoster(moviePosterPath: path, tag: 0, completion: { [weak self] (tag, img, error) in
                if let img = img {
                    self?.imageView.image = img;
                }
            })
        }

        self.genresLabel.text = String(format: "Genres: %@", movie.genresText());
        self.languageLabel.text = String(format: "Language: %@", movie.language ?? "");
        self.durationLabel.text = String(format: "Duration: %@", TimeFormatUtil.formatDuration(minutes: movie.duration ?? 0));
        self.synopsisLabel.text = movie.synopsis ?? "";
        
        if let p = movie.popularity {
            self.ratingLabel.text = String(format: "⭐️ %.02f", p);
        } else {
            self.ratingLabel.text = "";
        }
        
        self.nameLabel.text = movie.title ?? "";
        self.dateLabel.text = String(format:"Date: %@", movie.date ?? "");
    }
}

//mark: - MovieModel

fileprivate extension MovieModel {
    func genresText() -> String {
        if let genres = self.genres {
            return genres.joined(separator: ", ");
        }

        return "";
    }
}

