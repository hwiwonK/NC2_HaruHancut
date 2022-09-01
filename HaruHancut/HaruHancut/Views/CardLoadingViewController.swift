//
//  CardLoadingViewController.swift
//  HaruHancut
//
//  Created by Kim Hwiwon on 2022/08/31.
//

import UIKit

class CardLoadingViewController: UIViewController {
    
    private let textLabel : UILabel = {
        let label = UILabel()
        label.text = "한 컷 만드는 중"
        label.font = UIFont(name: "MaruBuri-Regular", size: 24)
        
        return label
    }()
    
    private let cameraImageView : UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "camera")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        imageView.image = image
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(textLabel)
        self.view.addSubview(cameraImageView)
        
        [textLabel, cameraImageView].forEach { component in
            component.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let textLabelConstraints = [
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 287),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let cameraImageViewConstraints = [
            cameraImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 367),
            cameraImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cameraImageView.heightAnchor.constraint(equalToConstant: 50),
            cameraImageView.widthAnchor.constraint(equalToConstant: 70)
            
        ]
        
        [textLabelConstraints, cameraImageViewConstraints].forEach { constraints in
            NSLayoutConstraint.activate(constraints)
        }
    }

}
