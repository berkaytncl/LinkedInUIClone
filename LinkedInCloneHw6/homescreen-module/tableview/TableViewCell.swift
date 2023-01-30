//
//  TableViewCell.swift
//  LinkedInCloneHw6
//
//  Created by Berkay Tuncel on 30.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postNameLabel: UILabel!
    @IBOutlet weak var postClosenessLabel: UILabel!
    @IBOutlet weak var postInformationLabel: UILabel!
    @IBOutlet weak var postLetterLabel: UILabel!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var postCommentCountLabel: UILabel!
    @IBOutlet weak var postRepostsCountLabel: UILabel!
    @IBOutlet weak var postLikeCountLable: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var postContentImageView: UIImageView!
    
    @IBOutlet weak var postSeeMoreButton: UIButton!
    
    let separator = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        separator.backgroundColor = .systemGray5
        contentView.addSubview(separator)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let separatorLineHeight: CGFloat = 10

        separator.frame = CGRect(x: self.contentView.frame.origin.x,
                                       y: self.contentView.frame.size.height - separatorLineHeight,
                                   width: self.contentView.frame.size.width,
                                  height: separatorLineHeight)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
