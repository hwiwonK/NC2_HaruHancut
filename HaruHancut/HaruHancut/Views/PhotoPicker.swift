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
            picker.navigationController?.pushViewController(CardLoadingViewController(), animated: true)

            itemProviders = results.map(\.itemProvider)
            iterator = itemProviders.makeIterator()
            cardMaker.displayNextImage()
        } else {
            picker.dismiss(animated: true)
        }
    }
    
}

