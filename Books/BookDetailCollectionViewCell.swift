//
//  BookDetailCollectionViewCell.swift
//  Books
//
//  Created by yongseok lee on 2022/07/20.
//

import UIKit

class BookDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookRateLabel: UILabel!
    
    let colorArray: [UIColor] = [.systemPink, .orange, .systemYellow, .blue, .systemMint, .purple]
    
    func cellSetting(book: Movie) {
        
        bookTitleLabel.text = book.title
        bookRateLabel.text = book.rate.description
        self.backgroundColor = colorArray.randomElement()
        self.layer.cornerRadius = 15
        bookTitleLabel.textColor = .white
        bookRateLabel.textColor = .white
    }
    
}
