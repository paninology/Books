//
//  BookDetailCollectionViewCell.swift
//  Books
//
//  Created by yongseok lee on 2022/07/20.
//

import UIKit
import Kingfisher

class BookDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookRateLabel: UILabel!
    
    let colorArray: [UIColor] = [.systemPink, .orange, .systemYellow, .blue, .systemMint, .purple, .systemTeal, ]
    let ImageURLDict = [
        "암살": "https://movie-phinf.pstatic.net/20150713_74/14367488229802tA3J_JPEG/movie_image.jpg?type=m886_590_2",
        "명량": "https://movie-phinf.pstatic.net/20140822_97/1408683329458ADWxI_JPEG/movie_image.jpg?type=m886_590_2",
        "광해": "https://movie-phinf.pstatic.net/20120820_196/1345429345496P2i9v_JPEG/movie_image.jpg?type=m886_590_2",
        "부산행": "https://movie-phinf.pstatic.net/20160628_230/14670934090256q5CM_JPEG/movie_image.jpg?type=m886_590_2",
        "어벤져스엔드게임": "https://movie-phinf.pstatic.net/20181210_97/15444094428286IhSF_JPEG/movie_image.jpg?type=m886_590_2"
    
    ]
    func cellSetting(book: Movie) {
        
        bookTitleLabel.text = book.title
        bookTitleLabel.font = .boldSystemFont(ofSize: 18)
        bookRateLabel.text = book.rate.description
        self.backgroundColor = colorArray.randomElement()
        self.layer.cornerRadius = 15
        bookTitleLabel.textColor = .white
        bookRateLabel.textColor = .white
        bookImageView.contentMode = .scaleAspectFill
    }
    
    func imageFetching(title: String) {
        guard let urlAdress = ImageURLDict[title] else {
            bookImageView.image = UIImage(systemName: "xmark")
            return }
        let url = URL(string: urlAdress )
        self.bookImageView.kf.setImage(with: url)
    }
}
