//
//  ViewController.swift
//  CinemaApp
//
//  Created by Diana Pava Avila on 15/07/23.
//

import UIKit

class ViewController: UIViewController {

    let idMovieCell = "movicell"
    var movies: [Int] = [1,2,3]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        

    }
    
    func setupTableView(){
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: idMovieCell)
        tableView.dataSource = self
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
        return cell
    }
    
    
}
