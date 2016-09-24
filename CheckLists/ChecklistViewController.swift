//
//  ChecklistViewController.swift
//  CheckLists
//
//  Created by Ahmed Lotfy on 9/24/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit

protocol CheckBoxesDelegate {
    func submitCheckboxes(checkboxesValue:[Bool])
}
private let reuseIdentifier = "CheckCell"
private let choicesCount = 15

class ChecklistViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate:CheckBoxesDelegate?
    
    var checklistTitles:[String] = Array(count: choicesCount, repeatedValue: "Choice 111111111111111111111111")
    private var checkListValues:[Bool] = Array(count: choicesCount, repeatedValue: false)
    
    enum CheckBox:String {
        case UnChecked = "checkbox-unchecked"
        case Checked = "checkbox-checked"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collectionView!.registerNib(UINib(nibName: "CheckCell", bundle: nil), forCellWithReuseIdentifier:reuseIdentifier)
        
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return checklistTitles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CheckCell
        let image:UIImage?
        if checkListValues[indexPath.row]{
            image = UIImage(named: CheckBox.Checked.rawValue)
        }else{
            image = UIImage(named: CheckBox.UnChecked.rawValue)
        }
        cell.checkboxImage.image = image
        cell.choiceTitle.text = "\(checklistTitles[indexPath.row]) \(indexPath.row)"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        checkListValues[indexPath.row] = !checkListValues[indexPath.row]
        collectionView.reloadData()
    }
    
    //MARK: Buttons Actions
    
    
    @IBAction func applyAction(sender: UIButton) {
        self.delegate?.submitCheckboxes(checkListValues)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelAction(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let length = (UIScreen.mainScreen().bounds.width) * 0.4
        return CGSizeMake(length,50);
    }
}
