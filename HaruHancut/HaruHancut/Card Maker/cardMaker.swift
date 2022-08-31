//
//  cardMaker.swift
//  HaruHancut
//
//  Created by Kim Hwiwon on 2022/08/31.
//

import Foundation

var itemProviders: [NSItemProvider] = []
var iterator: IndexingIterator<[NSItemProvider]>?

class cardMaker {
    static func displayNextImage() {
//        if let itemProvider = iterator?.next(), itemProvider.canLoadObject(ofClass: UIImage.self) {
//            let previousImage = selectedImageView.image
//
//            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
//                DispatchQueue.main.async {
//                    // Question: self.selectedImageView.image == previousImage가 필요한 이유?
//                    guard let self = self, let image = image as? UIImage, self.selectedImageView.image == previousImage else { return }
//                    self.selectedImageView.image = image
//                }
//            }
//        }
        print("displayNextImage")
    }
}
