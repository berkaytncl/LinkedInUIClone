//
//  ViewController.swift
//  LinkedInCloneHw6
//
//  Created by Berkay Tuncel on 29.01.2023.
//

import UIKit

class HomeScreen: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var postsTableView: UITableView!
    
    static let deviceWidth = UIScreen.main.bounds.width
    
    var postList = [Post]()
    
    var homeScreenPresenterObject: ViewToPresenterHomeScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeScreenRouter.createModule(ref: self)
        
        configureTableView()
        configureProfileImageViewRadius()
        configureTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeScreenPresenterObject?.uploadPosts()
    }
}

extension HomeScreen: PresenterToViewHomeScreenProtocol {
    func dataSendToView(postList: [Post]) {
        self.postList = postList
        self.postsTableView.reloadData()
    }
}

extension HomeScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! TableViewCell
    
        let post = postList[indexPath.row]
        
        cell.postImageView.layer.cornerRadius = 25
        cell.postImageView.clipsToBounds = true
        cell.postImageView.image = UIImage(named: post.profilePhoto)
        
        cell.postNameLabel.text = post.name
        
        cell.postInformationLabel.text = post.information
        
        if post.closeness == .first {
            cell.postClosenessLabel.text = "1st"
            cell.connectButton.isHidden = true
        } else {
            cell.connectButton.isHidden = false
            if post.closeness == .second {
                cell.postClosenessLabel.text = "2nd"
            } else {
                cell.postClosenessLabel.text = "3rd"
            }
        }
        
        let time = Date.now - post.postTime
        if time.month > 0 {
            cell.postTimeLabel.text = "\(time.month)mo"
        } else if time.day >= 7 {
            cell.postTimeLabel.text = "\(time.day / 7)w"
        } else if time.day > 0 {
            cell.postTimeLabel.text = "\(time.day)d"
        } else if time.hour > 0 {
            cell.postTimeLabel.text = "\(time.hour)h"
        } else {
            cell.postTimeLabel.text = "\(time.minute)m"
        }
        
        if post.postLetter.utf16.count >= 87 {
            cell.postLetterLabel.text = String(post.postLetter.prefix(87))
            cell.postSeeMoreButton.isHidden = false
        } else {
            cell.postLetterLabel.text = post.postLetter
            cell.postSeeMoreButton.isHidden = true
        }
        
        cell.postLikeCountLable.text = post.numberOfPostLikes.description
        cell.postCommentCountLabel.text = "\(post.numberOfPostComments) comments"
        cell.postRepostsCountLabel.text = "\(post.numberOfPostReposts) reposts"
        
        if let photo = post.postPhoto {
            cell.postContentImageView.isHidden = false
            cell.postContentImageView.image = UIImage(named: photo)
        } else {
            cell.postContentImageView.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard postList[indexPath.row].postPhoto != nil else { return 190 }
        
        return 300
    }
    
}

extension HomeScreen {
    
    func configureTableView() {
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.separatorStyle = .none
        postsTableView.backgroundColor = .systemGray5
    }
    
    func configureProfileImageViewRadius() {
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
    }
    
    func configureTabBar() {
        if let tabItems = tabBarController?.tabBar.items {
            let notificationsItem = tabItems[3]
            
            notificationsItem.badgeValue = "7"
            
            let lineView = UIView(frame: CGRect(x: 0, y: 0, width: HomeScreen.deviceWidth / 5, height: 2))
            lineView.backgroundColor = UIColor(named: "primaryColor")
            tabBarController?.tabBar.addSubview(lineView)
        }
        
        let appearance = UITabBarAppearance()
        
        changeColor(itemAppearance: appearance.stackedLayoutAppearance)
        changeColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    
    func changeColor(itemAppearance: UITabBarItemAppearance) {
        //selected
        itemAppearance.selected.iconColor = UIColor(named: "primaryColor")
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "primaryColor")!]
        itemAppearance.selected.badgeBackgroundColor = UIColor.red
        //others
        itemAppearance.normal.iconColor = UIColor(named: "secondaryColor")
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(named: "secondaryColor")!]
        itemAppearance.normal.badgeBackgroundColor = UIColor.red
    }
}
