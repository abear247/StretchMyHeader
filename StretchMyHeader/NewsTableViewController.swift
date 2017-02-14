//
//  NewsTableViewController.swift
//  StretchMyHeader
//
//  Created by Alex Bearinger on 2017-02-14.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    //Mark: Enum
    enum Categories: Int {
        case World
        case Europe
        case MiddleEast
        case Africa
        case AsiaPacific
        case Americas
        
        func Category() -> (colour: UIColor,name: String) {
            switch (self) {
            case .World:
                return (UIColor.red,"World")
            case .Europe:
                return (UIColor.green,"Europe")
            case .MiddleEast:
                return (UIColor.yellow,"Middle East")
            case .Africa:
                return (UIColor.orange,"Africa")
            case .AsiaPacific:
                return (UIColor.purple,"Asia Pacific")
            case .Americas:
                return (UIColor.blue,"Americas")
            }
        }
    }
    
// Mark: Struct
    struct NewsItem {
        var category: Categories
        var news: String
    }

    //Mark: Properties
    let news = [NewsItem.init(category: Categories.World, news: "Climate change protests, divestments meet fossil fuels realities"),
                NewsItem.init(category: Categories.Europe, news: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
                NewsItem.init(category: Categories.MiddleEast, news: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
                NewsItem.init(category: Categories.Africa, news: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
                NewsItem.init(category: Categories.AsiaPacific, news: "Despite UN ruling, Japan seeks backing for whale hunting"),
                NewsItem.init(category: Categories.Americas, news: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
                NewsItem.init(category: Categories.World, news: "South Africa in $40 billion deal for Russian nuclear reactors"),
                NewsItem.init(category: Categories.Europe, news: "'One million babies' created by EU student exchanges")]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let newsItem = news[indexPath.row]
        let category = newsItem.category
        cell.category.textColor = category.Category().colour
        cell.category.text = category.Category().name
        cell.headline.text = newsItem.news
        return cell
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

