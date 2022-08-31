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

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)

        itemProviders = results.map(\.itemProvider)
        iterator = itemProviders.makeIterator()
        displayNextImage()
    }
    
    func displayNextImage() {
        if let itemProvider = iterator?.next(), itemProvider.canLoadObject(ofClass: UIImage.self) {
            let previousImage = selectedImageView.image

            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async {
                    // Question: self.selectedImageView.image == previousImage가 필요한 이유?
                    guard let self = self, let image = image as? UIImage, self.selectedImageView.image == previousImage else { return }
                    self.selectedImageView.image = image
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayNextImage()
    }
    
}

