//
//  ChecklistViewController.swift
//  CheckLists
//
//  Created by Ahmed Lotfy on 9/24/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CheckCell"

class ChecklistViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collectionView!.registerNib(UINib(nibName: "CheckCell", bundle: nil), forCellWithReuseIdentifier:reuseIdentifier)
        
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/4, height: 50)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 40
        collectionView!.collectionViewLayout = layout
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 15
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CheckCell
        
        // Configure the cell
        cell.choiceTitle.text = "Choice \(indexPath.row)"
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.cellForItemAtIndexPath(indexPath)
    }
    
    // MARK: UICollectionViewDelegate
    /*
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let length = (UIScreen.mainScreen().bounds.width-15)/2
        return CGSizeMake(length,length);
    }*/
}
