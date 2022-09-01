//
//  cardMaker.swift
//  HaruHancut
//
//  Created by Kim Hwiwon on 2022/08/31.
//

import Foundation
import UIKit
import PhotosUI

var itemProviders: [NSItemProvider] = []
var iterator: IndexingIterator<[NSItemProvider]>?

class cardMaker {
    static let imageMoodModel = ImageMoodClassification()
    
    static func setInputImages(results: [PHPickerResult]) {
        itemProviders = results.map(\.itemProvider)
        iterator = itemProviders.makeIterator()
    }
    
    static func displayNextImage() {
        if let itemProvider = iterator?.next(), itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    print("displayNextImage start")
                    guard let image = image as? UIImage else { return }
                    getImageMood(inputImage: image)
                }
            }
        }
        
        print("displayNextImage finish")
    }
    
    static func getImageMood(inputImage : UIImage) {
        print("mood classification start")
        
        guard let convertedInputImage = inputImage.convertToBuffer() else { return }
        
        guard let imageMoodOutput = try? imageMoodModel.prediction(image: convertedInputImage) else {
            fatalError("Unexpected runtime error.")
        }
        
        print(imageMoodOutput.classLabel)
        
    }
    
}
