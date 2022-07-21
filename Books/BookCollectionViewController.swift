//
//  BookCollectionViewController.swift
//  Books
//
//  Created by yongseok lee on 2022/07/20.
//

import UIKit


class BookCollectionViewController: UICollectionViewController {

    let movies = MovieInfo().movie
    
    override func viewDidLoad() {
        super.viewDidLoad()

       layoutSetting()
    }
    
    func layoutSetting() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = (UIScreen.main.bounds.width - (3 * spacing)) / 2
        
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.itemSize = CGSize(width: width, height: width )
      
        collectionView.collectionViewLayout = layout
       
    }
    
    @IBAction func searchButtonClicked(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "BookSearch", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: "BookSearchTableViewController") as? BookSearchTableViewController else {
            print("VC nil error")
            return
        }
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .overFullScreen
        present(navi, animated: true)
        
    }
    
    
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookDetailCollectionViewCell", for: indexPath) as! BookDetailCollectionViewCell
        
        cell.cellSetting(book: movies[indexPath.row])
        cell.imageFetching(title: movies[indexPath.row].title)
        
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "BookDetail", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: BookDetailViewController.identifier) as? BookDetailViewController else {
            print("VC nil error from \(self)")
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
       
    }

    
}
