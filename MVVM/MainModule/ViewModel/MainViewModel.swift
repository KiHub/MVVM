//
//  MainViewModel.swift
//  MVVM
//
//  Created by  Mr.Ki on 31.03.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? {get set}
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        //MARK: - Fetch network data
        
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: nil,
                                               description: nil,
                                               numberPhone: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "success",
                                                         title: "Success",
                                                         description: "good",
                                                         numberPhone: nil)))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) { [weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "error",
                                                         title: "Error",
                                                         description: "No user",
                                                         numberPhone: nil)))
        }
        
    }
    
}
