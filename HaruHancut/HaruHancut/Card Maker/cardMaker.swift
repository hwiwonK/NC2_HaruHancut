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
    
    static func runMoodClassification() {
        itemProviders.forEach { item in
            item.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    guard let image = image as? UIImage else { return }
                    getImageMood(inputImage: image)
                }
            }
        }
    }
    
    static func getImageMood(inputImage : UIImage) {        
        guard let convertedInputImage = inputImage.convertToBuffer() else { return }
        
        guard let imageMoodOutput = try? imageMoodModel.prediction(image: convertedInputImage) else {
            fatalError("Unexpected runtime error.")
        }
        
        print(imageMoodOutput.classLabel)
        
    }
    
}
