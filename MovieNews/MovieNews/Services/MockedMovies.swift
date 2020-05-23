//
//  MockedMovies.swift
//  MovieNews
//
//  Created by Meruyert Tastandiyeva on 5/21/20.
//  Copyright © 2020 Meruyert Tastandiyeva. All rights reserved.
//

import Foundation
import UIKit

class MockedMovies: DataSource {
    func fetchMovies(page: Int, completion: @escaping ([MovieModel], NSError?) -> ()) {

        DispatchQueue.global(qos: .background).async {
            var result = [MovieModel]();

            for i in 0 ... 20 {
                let model = MovieModel();
                model.id = 1;
                model.title = "\(page)_\(i) movie title";
                model.popularity = 0;
                model.imageUrl = "/fphoto.jpg";
                model.date = "0000-00-00";

                result.append(model);
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                completion(result, nil);
            }
        }
    }

    func fetchMovieDetail(movieId: Int, completion: @escaping (MovieModel?, NSError?) -> ()) {

        DispatchQueue.global(qos: .background).async {
            let model = MovieModel();
            model.id = movieId;
            model.imageUrl = "/fphoto.jpg";
            model.title = "movie title";
            model.popularity = 0;
            model.synopsis = "A ticking-time-bomb insomniac and a slippery soap salesman" +
                " channel primal male aggression into a shocking new form of therapy." +
                " Their concept catches on, with underground \"fight clubs\" forming" +
                " in every town, until an eccentric gets in the way and ignites an" +
            " out-of-control spiral toward oblivion.";
            model.genres = [ "Drama", "Fight" ];
            model.language = "en";
            model.duration = 139;

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                completion(model, nil);
            }
        }
    }

    func fetchMoviePoster(moviePosterPath: String, tag: Int, completion: @escaping (Int, UIImage?, NSError?) -> ()) {

        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                completion(tag, UIImage(named: "no_image"), nil);
            }
        }
    }
}

