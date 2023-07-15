//
//  ViewController.swift
//  CinemaApp
//
//  Created by Diana Pava Avila on 15/07/23.
//

import UIKit

class ViewController: UIViewController {

    let idMovieCell = "movicell"
    var movies: [MovieModel] = []
    let popularRepository = PopularRepository()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getPopularMovies()
    }
    
    func setupTableView(){
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: idMovieCell)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
    }
    
    func getPopularMovies(){
        popularRepository.getPopular { movies in
            DispatchQueue.main.async {
                self.movies = movies
                self.tableView.reloadData()
            }
        } onFailure: { error in
            print(error)
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idMovieCell, for: indexPath) as? MovieTableViewCell else{
            return UITableViewCell()
        }
        cell.set(data: movies[indexPath.row])
        return cell
    }
    
    
}
