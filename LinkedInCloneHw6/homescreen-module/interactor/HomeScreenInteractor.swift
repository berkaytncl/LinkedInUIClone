//
//  HomeScreenInteractor.swift
//  LinkedInCloneHw6
//
//  Created by Berkay Tuncel on 30.01.2023.
//

import Foundation

class HomeScreenInteractor: PresenterToInteractorHomeScreenProtocol {
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol?
    
    func uploadPosts() {
        var postList = [Post]()
        
        let post1 = Post(name: "Macy Shannon", profilePhoto: "profile_photo_2", information: "iOS Developer at LinkedIn", closeness: .first, postTime: Date.now.addingTimeInterval(-261831), postLetter: "Swift Logo", postPhoto: "swift_logo", numberOfPostLikes: 79, numberOfPostComments: 41, numberOfPostReposts: 34)
        
        let post2 = Post(name: "Anais Krueger", profilePhoto: "profile_photo_3", information: "Android Developer at LinkedIn", closeness: .third, postTime: Date.now.addingTimeInterval(-9479172), postLetter: "LinkedIn ui clone done", postPhoto: "linkedin", numberOfPostLikes: 144, numberOfPostComments: 45, numberOfPostReposts: 59)
        
        let post3 = Post(name: "Elinor Rollins", profilePhoto: "profile_photo_4", information: "Backend Developer at LinkedIn", closeness: .first, postTime: Date.now.addingTimeInterval(-931234), postLetter: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", postPhoto: nil, numberOfPostLikes: 260, numberOfPostComments: 199, numberOfPostReposts: 100)
        
        let post4 = Post(name: "Cohen Watson", profilePhoto: "profile_photo_5", information: "Frontend Developer at LinkedIn", closeness: .second, postTime: Date.now.addingTimeInterval(-249884), postLetter: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", postPhoto: nil, numberOfPostLikes: 46, numberOfPostComments: 25, numberOfPostReposts: 21)
        
        let post5 = Post(name: "Elias Wallace", profilePhoto: "profile_photo_6", information: "iOS Developer at LinkedIn", closeness: .second, postTime: Date.now.addingTimeInterval(-2092), postLetter: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", postPhoto: nil, numberOfPostLikes: 55, numberOfPostComments: 13, numberOfPostReposts: 22)
        
        postList.append(post1)
        postList.append(post2)
        postList.append(post3)
        postList.append(post4)
        postList.append(post5)
        
        homeScreenPresenter?.dataSendToPresenter(postList: postList)
    }
}
