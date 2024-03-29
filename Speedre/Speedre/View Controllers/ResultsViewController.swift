//
//  resultsVC.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/6/19.
//  Copyright © 2019 TAPS. All rights reserved.
//
import UIKit
import Foundation
import CoreData
class ResultsViewController: UIViewController{
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timerLabel.text = String(format: "%.1f", time)
        self.resultsLabel.text = "You \(result) to include a \(item.currItem()) in your photo"
        //persists item+time if item was found in photo
        if(correct){
        let results = Score(context: dataController.viewContext)
        results.time = time
        results.item = item.currItem()
        do {
            try dataController.viewContext.save()
        } catch {
            return
        }
        }
    }
    //fucntion called when try again is pressed
    @IBAction func tryAgainPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //function called when new item is pressed
    @IBAction func newItemPressed(_ sender: Any) {
        time=0.0
        item.newItem()
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "promptVC")
        self.present(vc, animated: true)
    }
    //function called when "All Scores" is pressed
    @IBAction func allScoresPressed(_ sender: Any) {
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "scoresVC")
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true)
    }
}
