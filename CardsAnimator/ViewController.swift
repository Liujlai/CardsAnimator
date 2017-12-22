//
//  ViewController.swift
//  CardsAnimator
//
//  Created by idea on 2017/12/21.
//  Copyright © 2017年 idea. All rights reserved.
//


import UIKit
import ViewAnimator

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Ccell")
        collectionView.dataSource = self

        tableView.tableFooterView = UIView()
        tableView.dataSource = self
    }

    @IBAction func animator(_ sender: Any) {
        view.animateRandom()
        
        //         Combined animations example
        //        let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
        //        let zoomAnimation = AnimationType.zoom(scale: 0.2)
        //        let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
        //        collectionView.animateViews(animations: [zoomAnimation, rotateAnimation], duration: 0.5)
        //        tableView.animateViews(animations: [fromAnimation, zoomAnimation], duration: 0.5)
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
        cell.imgView.image = UIImage(named: "monument")
        return cell
    }
    //单元格高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath)
        -> CGFloat {
            return 60
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Ccell", for: indexPath) as! CollectionViewCell
        cell.card.itemTitle =  "Welcome \(indexPath)!"
        let cardContent = storyboard?.instantiateViewController(withIdentifier: "CardContent")
        cell.card.shouldPresent(cardContent, from: self, fullscreen: false)
        return cell
    }
}



