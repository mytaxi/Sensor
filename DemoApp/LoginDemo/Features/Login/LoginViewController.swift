//
//  ViewController.swift
//  LoginDemo
//
//  Created by Mounir Dellagi on 13.02.18.
//  Copyright © 2019 Intelligent Apps GmbH. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class LoginViewController: UIViewController {

    private let disposeBag = DisposeBag()

    private var rootView: LoginView
    private var output: Driver<LoginView.Model>

    override var prefersStatusBarHidden: Bool {
        return true
    }

    init(output: Driver<LoginView.Model>, rootView: LoginView) {
        self.output = output
        self.rootView = rootView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        output.drive(rootView.rx.inputs)
            .disposed(by: disposeBag)
    }
}
