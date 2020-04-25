//
//  Item.swift
//  IndividualApp
//
//  Created by Rendong Zhang 
//  Copyright © 2020 Rendong Zhang. All rights reserved.
//

import Foundation
import UIKit

class Item: NSObject, NSCoding {
    var name: String
    var sales: String
    var company: String
    let year: String
    
    init(name: String, sales : String, company: String, year : String) {
        self.name = name
        self.sales = sales
        self.company = company
        self.year = year
        
        super.init()
    }
    
//    convenience init(random: Bool = false) {
//        if random {
//            //    ["A","200", "RZ", "2020"],
//            ["B","100000","RZ", "2020"],
//            ["C","3","RZ", "2020"],
//            ["D","9978","RZ", "2020"]
//            let adjectives = ["Fluffy", "Rusty", "Shiny"]
//            let nouns = ["Bear", "Spork", "Mac"]
//
//            var idx = arc4random_uniform(UInt32(adjectives.count))
//            let randomAdjective = adjectives[Int(idx)]
//
//            idx = arc4random_uniform(UInt32(nouns.count))
//            let randomNoun = nouns[Int(idx)]
//
//            let randomName = "\(randomAdjective) \(randomNoun)"
//            let randomValue = Int(arc4random_uniform(100))
//            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
//            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
//        }
//        else {
//            self.init(name: "", serialNumber: nil, valueInDollars: 0)
//        }
//    }
    func encode(with aCoder:NSCoder){
        aCoder.encode(name,forKey: "name")
        aCoder.encode(sales,forKey: "sales")
        aCoder.encode(company,forKey: "company")
        aCoder.encode(year,forKey: "year")
    }
    required init(coder aDeCoder: NSCoder) {
        name = aDeCoder.decodeObject(forKey: "name") as! String
        sales = aDeCoder.decodeObject(forKey: "sales") as! String
        company  = aDeCoder.decodeObject(forKey: "company") as! String
        year = aDeCoder.decodeObject(forKey: "year") as! String
        super.init()
    }
}
