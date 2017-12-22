//
//  CollectionViewCell.swift
//  CardsAnimator
//
//  Created by idea on 2017/12/21.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit
import Cards

class CollectionViewCell: UICollectionViewCell {
    
    lazy var card: CardHighlight = {
     let card = CardHighlight(frame: self.bounds)
        card.backgroundColor = UIColor(red: 34, green: 131/255, blue: 53/255, alpha: 1)
        card.icon = UIImage(named: "flappy")
        card.title = "Welcome \nto \nCardsAnimator !"
        card.itemTitle = "CardsAnimator"
        card.itemSubtitle = "Cards Animator !"
        card.textColor = UIColor.white
        card.buttonText = "HEY!"
        card.hasParallax = true
        return card
    }()
  
    override func layoutSubviews() {
        addSubview(card)
    }
}

