//
//  PopularRepository.swift
//  CinemaApp
//
//  Created by Diana Pava Avila on 15/07/23.
//

import Foundation

class PopularRepository: Repository {
    func getPopular(onSuccess: @escaping ([MovieModel]) -> Void, onFailure: @escaping (Error) -> Void){
        client.request(url: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc", headers: headers) { (result: MovieResponse<MovieModel>) in
            onSuccess(result.results)
        } onFailure: { error in
            onFailure(error)
        }
    }
}
