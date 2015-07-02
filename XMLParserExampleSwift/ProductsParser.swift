//
//  ProductsParser.swift
//  XMLParserExampleSwift
//
//  Created by Fenkins on 01/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import Foundation

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
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        element = elementName
        
        // Instantiating
        if (element as NSString).isEqualToString("Product") {
            elements = NSMutableDictionary.alloc()
            elements = [:]
            productName = NSMutableString.alloc()
            productName = ""
            productDescrition = NSMutableString.alloc()
            productDescrition = ""
        }
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        if element.isEqualToString("Name") {
            productName.appendString(string!)
        } else if element.isEqualToString("Description") {
            productDescrition.appendString(string!)
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString) .isEqualToString("Product") {
            if productName != "" {
                elements.setObject(productName, forKey: "Product Name")
            }
            if productDescrition != "" {
                elements.setObject(productDescrition, forKey: "Product Description")
            }
        productArray.addObject(elements)
        }
    }    
}