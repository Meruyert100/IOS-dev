//
//  RESTService.swift
//  MovieNews
//
//  Created by Meruyert Tastandiyeva on 5/21/20.
//  Copyright © 2020 Meruyert Tastandiyeva. All rights reserved.
//

import Foundation

class RESTService {

    let session: URLSession;

    init() {
        self.session = URLSession(configuration: .default);
    }

    func GET(url: String, completion: @escaping (Data?, Error?) -> ()) {

        guard let url = URL(string: url) else {
            completion(nil, NSError());
            return;
        }

        self.session.dataTask(with: url) { (data, response, error) in
            completion(data, error);
            }.resume();
    }
}
