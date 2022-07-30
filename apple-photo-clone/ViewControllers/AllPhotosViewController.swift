//
//  AllPhotosViewController.swift
//  apple-photo-clone
//
//  Created by 나지운 on 2022/07/29.
//

import UIKit
import Kingfisher

class AllPhotosViewController: UIViewController {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    var photoList = PhotoInfos().photoInfos
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewDelegate()
        registerNib()

        designUI()
    }
    
    func collectionViewDelegate() {
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
    }
    
    func registerNib() {
        let nibName = UINib(nibName: PhotoCollectionViewCell.identifier, bundle: nil)
        photoCollectionView.register(nibName, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    }
    
    // MARK: - [디자인]
    func designUI() {
        designNavigationBar()
        designCollectionView()
    }
    
    func designNavigationBar() {
        navigationItem.title = "All Photos"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(selectButtonClicked))
    }
    
    // MARK: - [클릭액션]
    @objc func selectButtonClicked() {
        // TODO: select mode 구현
    }
    
}

// MARK: - [콜렉션 뷰]
extension AllPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { print("Not found PhotoCollectionViewCell"); return UICollectionViewCell() }
        
        cell.photoImageView.contentMode = .scaleAspectFill
        cell.photoImageView.kf.setImage(with: photoList[indexPath.row].imageURL)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: PhotoDetailViewController.identifier) as? PhotoDetailViewController else { print("Not found PhotoDetailViewController"); return }
        
        vc.photoURL = photoList[indexPath.row].imageURL
        hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        hidesBottomBarWhenPushed = false
        
    }
    
    func designCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 2.5
        let width = UIScreen.main.bounds.width - (spacing * 2)
        
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        photoCollectionView.collectionViewLayout = layout
    }
    
}
