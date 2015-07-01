//
//  ProductsParser.swift
//  XMLParserExampleSwift
//
//  Created by Fenkins on 01/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import Foundation

class ProductParser:NSObject, NSXMLParserDelegate {
    let path = NSBundle.mainBundle().pathForResource("productsList", ofType: ".xml")
}