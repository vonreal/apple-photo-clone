//
//  PhotoDetailViewController.swift
//  apple-photo-clone
//
//  Created by 나지운 on 2022/07/29.
//

import UIKit
import Kingfisher

class PhotoDetailViewController: UIViewController {

    static let identifier = "PhotoDetailViewController"
    
    // 저장속성(값 전달)
    var photoURL: URL?
    
    // 아울렛 변수
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
    }
    
    // MARK: - [디자인]
    func designUI() {
        designImageView()
        designNavigationBar()
    }
    
    func designImageView() {
        guard let url = photoURL else { print("Not found url"); return }
        
        photoImageView.kf.setImage(with: url)
        photoImageView.contentMode = .scaleAspectFit
    }
    
    func designNavigationBar() {
        navigationItem.title = "2009년 10월 10일(임시)"
        navigationItem.leftBarButtonItem?.title = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonClicked))
    }
    
    // MARK: - [클릭시]
    @objc func editButtonClicked() {
        // TODO: 편집 기능 구현
    }
}
