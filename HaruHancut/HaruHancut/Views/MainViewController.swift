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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableTitleLabel)
        
        [tableTitleLabel].forEach { component in
            component.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let tableTitleLabelConstraints = [
            tableTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        [tableTitleLabelConstraints].forEach { constraints in
            NSLayoutConstraint.activate(constraints)
        }
    }

}

