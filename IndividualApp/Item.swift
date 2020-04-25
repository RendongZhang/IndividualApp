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
