//
//  HomeScreenProtocols.swift
//  LinkedInCloneHw6
//
//  Created by Berkay Tuncel on 30.01.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterHomeScreenProtocol {
    var homeScreenInteractor: PresenterToInteractorHomeScreenProtocol? { get set }
    var homeScreenView: PresenterToViewHomeScreenProtocol? { get set }
    
    func uploadPosts()
}

protocol PresenterToInteractorHomeScreenProtocol {
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol? { get set }
    
    func uploadPosts()
}

//Carrer Protocoller
protocol InteractorToPresenterHomeScreenProtocol {
    func dataSendToPresenter(postList: [Post])
}

protocol PresenterToViewHomeScreenProtocol {
    func dataSendToView(postList: [Post])
}

//Router Protocol
protocol PresenterToRouterHomeScreenProtocol {
    static func createModule(ref: HomeScreen)
}
