//
//  Photo.swift
//  apple-photo-clone
//
//  Created by 나지운 on 2022/07/29.
//

import Foundation

struct Photo {
    var imageURL: URL?
}

struct PhotoInfos {
    var photoInfos: [Photo] = [
        Photo(imageURL: URL(string: "https://cdn.pixabay.com/photo/2022/07/25/15/18/cat-7344042__340.jpg")),
        Photo(imageURL: URL(string: "https://cdn.pixabay.com/photo/2022/05/18/12/04/flower-7205105__340.jpg")),
        Photo(imageURL: URL(string: "https://cdn.pixabay.com/photo/2022/07/10/19/30/house-7313645__340.jpg")),
        Photo(imageURL: URL(string: "https://cdn.pixabay.com/photo/2020/04/30/03/26/rufous-5111261__340.jpg")),
        Photo(imageURL: URL(string: "https://cdn.pixabay.com/photo/2022/06/26/14/53/bird-7285669__340.jpg")),
        Photo(imageURL: URL(string: "https://cdn.pixabay.com/photo/2022/07/22/13/23/coast-7338147__340.jpg"))
    ]
}
