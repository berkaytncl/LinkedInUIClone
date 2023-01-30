//
//  Posts.swift
//  LinkedInCloneHw6
//
//  Created by Berkay Tuncel on 30.01.2023.
//

import Foundation

struct Post {
    let name: String
    let profilePhoto: String
    let information: String
    let closeness: Closeness
    let postTime: Date
    let postLetter: String
    let postPhoto: String?
    let numberOfPostLikes: Int
    let numberOfPostComments: Int
    let numberOfPostReposts: Int
}

enum Closeness {
    case first, second, third
}
