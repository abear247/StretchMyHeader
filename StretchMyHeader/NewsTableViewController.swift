//
//  NewsTableViewController.swift
//  StretchMyHeader
//
//  Created by Alex Bearinger on 2017-02-14.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    //Mark: Properties
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    private let kTableHeaderHeight:  CGFloat = 250.0
    private let kTableHeaderCutAway: CGFloat = 80.0
    var headerMaskLayer: CAShapeLayer!
    
    let news = [NewsItem.init(category: Categories.World, news: "Climate change protests, divestments meet fossil fuels realities"),
                NewsItem.init(category: Categories.Europe, news: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
                NewsItem.init(category: Categories.MiddleEast, news: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
                NewsItem.init(category: Categories.Africa, news: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
                NewsItem.init(category: Categories.AsiaPacific, news: "Despite UN ruling, Japan seeks backing for whale hunting"),
                NewsItem.init(category: Categories.Americas, news: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
                NewsItem.init(category: Categories.World, news: "South Africa in $40 billion deal for Russian nuclear reactors"),
                NewsItem.init(category: Categories.Europe, news: "'One million babies' created by EU student exchanges")]
    
    //MARK: Enum
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
                return (UIColor.cyan,"Asia Pacific")
            case .Americas:
                return (UIColor.blue,"Americas")
            }
        }
    }
    
    // MARK: Struct
    struct NewsItem {
        var category: Categories
        var news: String
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        let stringDate: String = dateFormatter.string(from: Date())
        dateLabel.text = stringDate
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = headerMaskLayer
        
        updateHeaderView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    //MARK: helper functions
    func updateHeaderView(){
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + kTableHeaderCutAway/2
        }
        headerView.frame = headerRect
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0, y: headerRect.height-kTableHeaderCutAway))
        headerMaskLayer?.path = path.cgPath
    }
}

