//
//  DataSource.swift
//  MovieNews
//
//  Created by Meruyert Tastandiyeva on 5/21/20.
//  Copyright © 2020 Meruyert Tastandiyeva. All rights reserved.
//

import Foundation
import UIKit

protocol DataSource {
    func fetchMovies(page: Int, completion: @escaping ([MovieModel], NSError?) -> ());
    func fetchMovieDetail(movieId: Int, completion: @escaping (MovieModel?, NSError?) -> ());
    func fetchMoviePoster(moviePosterPath: String, tag: Int, completion: @escaping (Int, UIImage?, NSError?) -> ());
}
