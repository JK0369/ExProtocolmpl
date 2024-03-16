//
//  ViewController.swift
//  ExProtocolImpl
//
//  Created by 김종권 on 2024/03/16.
//

import UIKit

protocol SomeModelable {
    var a: Int { get }
    var b: String { get }
}
class ViewController: UIViewController {
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.configure(model: instance)
    }
    
    // good case
    let instance: SomeModelable = {
        struct TemporaryModel: SomeModelable {
            let a: Int
            let b: String
        }
        return TemporaryModel(a: 12345, b: "67890")
    }()

}

class ViewModel {
    func configure(model: SomeModelable) {
        // ...
    }
}

// bad case
/*
struct MyModel: SomeModelable {
    var a: Int
    var b: String
}
*/
