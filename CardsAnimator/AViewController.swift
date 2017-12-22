//
//  AViewController.swift
//  CardsAnimator
//
//  Created by idea on 2017/12/21.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit
import Cards
import Cupcake

class AViewController: UIViewController {
    
    var viewA:UIView!
    var viewB:UIView!
    var viewC:UIView!
    var viewD:UIView!
    
    var lab:UILabel!
    var btn:UIButton!
    var imgView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewA()
        setupViewB()
        setupViewC()
        setupViewD()
        setuplab()
        setupbtn()
        setupimgView()
//        view.backgroundColor = Color("random")
//        self.view.addSubview(viewA)
        view.bg("monument")
        self.view.addSubviews(viewA,viewD,lab,btn)
    }
    func setupViewA(){
        viewA = UIView()
        viewA.bg("#cc44cc").border(1).radius(4).shadow(0.7,2)
            .makeCons { (make) in
                make.left.top.equal(50,50)
                make.width.height.equal(200)
        }
    }
    func setupViewB(){
        viewB = View.bg("random,0.5").border(1).radius(4).shadow(0.7,2)
        .embedIn(viewA,10)
    }
    func setupViewC(){
        viewC = View.bg("0,55,88,0.8").border(1).radius(4).shadow(0.7,2)
            .embedIn(viewB,10,20)
    }
    func setupViewD(){
        viewD = View.bg("random").border(1).radius(4).shadow(0.8,2)
            .makeCons({
                $0.origin.equal(viewA).offset(-20,200)
                $0.width.equal(100)
                $0.height.equal(viewC).multiply(2)
            })
    }
    func setuplab(){
        lab = Label.str("Hello.aa.俗世呀").font(30).color("#fbfbfb").lines(1).align(.center)
            .makeCons({ (make) in
                make.left.top.equal(viewD).right.top.offset(0)
            })
    }
    func setupbtn(){
        btn = Button.str("Swift").font("30").bg("lightGray,0.3").highBg("lightGray,0.8").radius(-1).onClick({ _ in
            print("click__btn___")
            self.present(BViewController(), animated: true, completion: nil)
        })
            .padding(5).border(1,"#cfc888")
            .makeCons({ (make) in
                make.left.top.equal(lab).left.bottom.offset(0)
                make.width.height.equal(lab)
            })
    }
    func setupimgView(){
        imgView = ImageView.img("$monument").tint("#88bb55").mode(.scaleAspectFit).pin(.center).pin(100,100).addTo(viewD).onClick({ (_) in
             Alert.title("Alert").message("hell开始大口大口宽度").action("OK").show()
        }).radius(-1)
    }
}
