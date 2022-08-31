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
        label.text = "Loading..."
        
        return label
    }()
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        cardMaker.displayNextImage()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(textLabel)
        
        [textLabel].forEach { component in
            component.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let textLabelConstraints = [
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        [textLabelConstraints].forEach { constraints in
            NSLayoutConstraint.activate(constraints)
        }
    }

}
