//
//  ViewController.swift
//  HaruHancut
//
//  Created by Kim Hwiwon on 2022/08/31.
//

import UIKit

class MainViewController: UIViewController {

    private let tableTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.systemGray
        label.text = "Hello, world!"
        return label
    }()
    
    private let createCardButton : UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "mainBeige")
        configuration.background.cornerRadius = 10
        configuration.title = "한 컷 만들기"
        configuration.attributedTitle?.font = UIFont.preferredFont(forTextStyle: .title2)
        
        let button = UIButton(configuration: configuration)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(createCardButton)
        
        [createCardButton].forEach { component in
            component.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let createCardButtonConstraints = [
            createCardButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 505),
            createCardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 95),
            createCardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -95),
            createCardButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        [createCardButtonConstraints].forEach { constraints in
            NSLayoutConstraint.activate(constraints)
        }
    }

}

