//
//  cardMaker.swift
//  HaruHancut
//
//  Created by Kim Hwiwon on 2022/08/31.
//

import Foundation
import UIKit
import PhotosUI

enum imageMoodCategories: String {
    case joy
    case sadness
    case anger
    case love
    case surprise
    case fear
}

var itemProviders: [NSItemProvider] = []
var iterator: IndexingIterator<[NSItemProvider]>?
var imageMoodResult: String = String()
var imageMoodArray : [imageMoodCategories : Int] = [
    imageMoodCategories.joy : 0,
    imageMoodCategories.sadness : 0,
    imageMoodCategories.anger : 0,
    imageMoodCategories.love : 0,
    imageMoodCategories.surprise : 0,
    imageMoodCategories.fear : 0,
]

// 카드에 필요한 이미지 정보 : 분위기, 색깔, 객체
struct cardInfo {
    var imageMoodResult = String()
}

class cardMaker {
    static var cardInfoResult = cardInfo() // 카드에 필요한 이미지 정보 저장
    
    static let imageMoodModel = ImageMoodClassification() // 이미지 분위기 분류 모델 인스턴스
    
    static func setInputImages(results: [PHPickerResult]) {
        itemProviders = results.map(\.itemProvider)
    }
    
    static func runMoodClassification() {
        // 선택된 모든 이미지에 대해 분위기 추출 (forEach 활용)
        itemProviders.enumerated().forEach { (index, item) in
            item.loadObject(ofClass: UIImage.self) { image, error in
                // 이미지 분위기 분류 비동기 처리
                DispatchQueue.main.async {
                    guard let image = image as? UIImage else { return }
                    guard let imageMood = imageMoodCategories(rawValue : getImageMood(inputImage: image)) else { return }
                    imageMoodArray[imageMood]! += 1
                    
                    // 모든 이미지 처리가 완료되을 때
                    if (index == itemProviders.count - 1) { //인덱스가 아닌, 처리가 완료된 이미지를 체크해서 진행해야 될 것 같음
                        generateImageMoodResult()
                    }
                }
            }
        }
    }
    
    // 하나의 이미지에 대한 분위기 추출
    static func getImageMood(inputImage : UIImage) -> String {
        var output : String
        guard let convertedInputImage = inputImage.convertToBuffer() else {
            fatalError("UIImage cannot converted to CVBuffer.")
        }
        
        guard let imageMoodOutput = try? imageMoodModel.prediction(image: convertedInputImage) else {
            fatalError("Unexpected runtime error.")
        }
        
        output = imageMoodOutput.classLabel

        return output
        
    }
    
    // 이미지의 분위기 중 가장 많이 추출된 분위기 찾기
    static func generateImageMoodResult() {
        print("final imageMoodArray")
        print(imageMoodArray)
        
        let sortedImageMoodArray = imageMoodArray.sorted { $0.1 > $1.1 }
        
        print("sorted imageMoodArray")
        print(sortedImageMoodArray)
        
        cardInfoResult.imageMoodResult = sortedImageMoodArray[0].key.rawValue
        print("final image mood")
        print(cardInfoResult.imageMoodResult)
    }
    
}
