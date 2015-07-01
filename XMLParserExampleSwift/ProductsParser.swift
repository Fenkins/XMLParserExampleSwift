//
//  ProductsParser.swift
//  XMLParserExampleSwift
//
//  Created by Fenkins on 01/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import Foundation
import UIKit

class ProductParser:NSObject, NSXMLParserDelegate {
    
    var parser = NSXMLParser()
    var productArray = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var productName = NSMutableString()
    var productDescrition = NSMutableString()
    
    func execParse() {
        productArray = []
        var url:NSURL = NSURL(fileURLWithPath: (NSBundle.mainBundle().pathForResource("productsList", ofType: ".xml"))!)!
        parser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
        parser.parse()
        
    }
    
    
    
    
    
}