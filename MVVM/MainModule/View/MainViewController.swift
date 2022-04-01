//
//  ViewController.swift
//  MVVM
//
//  Created by  Mr.Ki on 31.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!
    let signButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        ///????
       viewModel = MainViewModel()
        
        createView()
        updateView()
        style()
        layout()
        
    }

    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }

    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
    
}

extension MainViewController {
    private func style() {
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.configuration = .filled()
        signButton.configuration?.imagePadding = 8
        signButton.setTitle("Start", for: [])
        signButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    }
    private func layout() {
        view.addSubview(signButton)
        NSLayoutConstraint.activate([
            signButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 18),
        signButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 8),
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: signButton.trailingAnchor, multiplier: 8),
        ])
        
    }

}

extension MainViewController {
    @objc func signInTapped(sender: UIButton) {
        viewModel.startFetch()
        
    }
    
}
