//
//  HomeScreenRouter.swift
//  LinkedInCloneHw6
//
//  Created by Berkay Tuncel on 30.01.2023.
//

import Foundation

class HomeScreenRouter: PresenterToRouterHomeScreenProtocol {
    static func createModule(ref: HomeScreen) {
        let presenter = HomeScreenPresenter()
        
        //View
        ref.homeScreenPresenterObject = presenter
        
        //Presenter
        ref.homeScreenPresenterObject?.homeScreenInteractor = HomeScreenInteractor()
        ref.homeScreenPresenterObject?.homeScreenView = ref
        
        //Interactor
        ref.homeScreenPresenterObject?.homeScreenInteractor?.homeScreenPresenter = presenter
    }
}
