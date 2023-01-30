//
//  HomeScreenPresenter.swift
//  LinkedInCloneHw6
//
//  Created by Berkay Tuncel on 30.01.2023.
//

import Foundation

class HomeScreenPresenter: ViewToPresenterHomeScreenProtocol {
    
    var homeScreenInteractor: PresenterToInteractorHomeScreenProtocol?
    var homeScreenView: PresenterToViewHomeScreenProtocol?
    
    func uploadPosts() {
        homeScreenInteractor?.uploadPosts()
    }
}

extension HomeScreenPresenter: InteractorToPresenterHomeScreenProtocol {
    func dataSendToPresenter(postList: [Post]) {
        homeScreenView?.dataSendToView(postList: postList)
    }
}
