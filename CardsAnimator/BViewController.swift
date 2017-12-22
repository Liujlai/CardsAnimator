//
//  BViewController.swift
//  CardsAnimator
//
//  Created by idea on 2017/12/22.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit
import Cupcake

class BViewController: BaseViewController{
    override func setupUI() {
        weak var weakSelf = self
        
        GroupTable(
            Section(
                Row.height(60).img("flappy").str("flappy flappy").switchOn(false).onClick({ (row) in
                    print(row.switchView.isOn)
                }),
                Row.height(60).img("flappy").str("flappy").arrow().onClick({ (_) in
                    weakSelf?.push(ViewController())
                }),
                Row.height(60).img("flappy").str("flappy").arrow().onClick({ (_) in
                    weakSelf?.push(ViewController())
                })
            ),
            Section(
                Row.height(60).img("flappy").str("flappy").arrow().custom({ (row) in
                    let badge = Button.pin(22, 22, .maxX(-5), .centerY(0)).radius(-1).str(1).font(14).bg("red")
                    badge.isUserInteractionEnabled = false
                    row.cell.contentView.addSubview(badge)
                }).onClick({ (_) in
                    weakSelf?.push(ViewController())
                }),
                Row.height(60).img("flappy").str("flappy flappy ").arrow().onClick({ (_) in
                    weakSelf?.push(ViewController())
                })
            )
        ).embedIn(self.view)
    }

    

}
class BaseViewController: UIViewController {
    
    func push(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupUI() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
    }
}
