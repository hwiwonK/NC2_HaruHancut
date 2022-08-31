//
//  ViewController.swift
//  HaruHancut
//
//  Created by Kim Hwiwon on 2022/08/31.
//

import UIKit

class MainViewController: UIViewController {
    
    var itemProviders: [NSItemProvider] = []
    var iterator: IndexingIterator<[NSItemProvider]>?

    var selectedImageView = UIImageView()
    
    private let createCardButton : UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "mainBeige")
        configuration.background.cornerRadius = 10
        configuration.title = "한 컷 만들기"
        configuration.attributedTitle?.font = UIFont.preferredFont(forTextStyle: .title2)
        
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(clickCreateCardButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func clickCreateCardButton() {
        present(photoPicker, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(selectedImageView)
        self.view.addSubview(createCardButton)
        
        [selectedImageView, createCardButton].forEach { component in
            component.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let createCardButtonConstraints = [
            createCardButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 505),
            createCardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 95),
            createCardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -95),
            createCardButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let selectedImageViewConstraints = [
            selectedImageView.heightAnchor.constraint(equalToConstant: 200),
            selectedImageView.widthAnchor.constraint(equalToConstant: 200),
            selectedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ]
        
        [selectedImageViewConstraints, createCardButtonConstraints].forEach { constraints in
            NSLayoutConstraint.activate(constraints)
        }
    }

}

