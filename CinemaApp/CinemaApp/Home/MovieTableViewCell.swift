//
//  MovieTableViewCell.swift
//  CinemaApp
//
//  Created by Diana Pava Avila on 15/07/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(data: MovieModel){
        movieTitleLabel.text = data.original_title
    }

}
