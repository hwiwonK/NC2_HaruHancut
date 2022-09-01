//
//  PhotoPicker.swift
//  HaruHancut
//
//  Created by Kim Hwiwon on 2022/08/31.
//

import PhotosUI

// reference : https://developer.apple.com/videos/play/wwdc2020/10652/

extension MainViewController: PHPickerViewControllerDelegate {

    var photoPicker: PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
        config.filter = PHPickerFilter.images

        let photoPicker = PHPickerViewController(configuration: config)
        photoPicker.delegate = self

        return photoPicker
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: false)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty {
            print(results)
            picker.navigationController?.pushViewController(CardLoadingViewController(), animated: true)
            cardMaker.setInputImages(results: results) //선택한 이미지 저장
            cardMaker.displayNextImage() //현재 이미지에 대한 분석 시작
        } else {
            picker.dismiss(animated: true)
        }
    }
    
}

