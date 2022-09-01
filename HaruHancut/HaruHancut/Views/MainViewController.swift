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
    
    private let titleLabel : UILabel = {
        var label = UILabel()
        label.text = "하루 한 컷"
        label.font = UIFont(name: "MaruBuri-SemiBold", size: 28)
//        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let descriptionLabel : UILabel = {
        var label = UILabel()
        label.text = "하루를 담은 한 컷을 만들어보세요"
//        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.font = UIFont(name: "MaruBuri-Regular", size: 20)
        return label
    }()
    
    private let createCardButton : UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "mainBeige")
        configuration.background.cornerRadius = 10
        configuration.title = "한 컷 만들기"
        configuration.attributedTitle?.font = UIFont(name: "MaruBuri-Regular", size: 22)
        
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(clickCreateCardButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func clickCreateCardButton() {
        let navigationController = UINavigationController(rootViewController: photoPicker)
        navigationController.isNavigationBarHidden = true
        navigationController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(navigationController, animated: true, completion: nil)
        
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
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        
        [selectedImageView, createCardButton, titleLabel, descriptionLabel].forEach { component in
            component.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 234),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
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
        
        [titleLabelConstraints, descriptionLabelConstraints, selectedImageViewConstraints, createCardButtonConstraints].forEach { constraints in
            NSLayoutConstraint.activate(constraints)
        }
    }

}

