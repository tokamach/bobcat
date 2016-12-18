//
//  URLParser.swift
//  bobcat
//
//  Created by Tom Hutchings on 18/12/2016.
//  Copyright © 2016 Tom Hutchings. All rights reserved.
//

import Foundation

//thanks to Ben Scheirman(http://benscheirman.com/2014/06/regex-in-swift/) for the idea
class Regex
{
    var internalExpression: NSRegularExpression
    var pattern: String
    
    init(_ pattern: String)
    {
        self.pattern = pattern
        if(pattern.isEmpty)
        {
            self.pattern = " "
        }
        try! self.internalExpression = NSRegularExpression(pattern: self.pattern, options: .caseInsensitive)
    }
    
    func test(input: String) -> Bool
    {
        let matches = internalExpression.matches(in: input,
                                                 options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                                 range: NSMakeRange(0, input.characters.count))
        return (matches.count > 0)
    }
}

class URLParser
{
    public func parseURL(inputURL: String) -> String
    {
        let urlRegex = Regex(inputURL)
        if(urlRegex.test(input: "http*"))
        {
            exit(-1)
        }
        
        return inputURL
    }
}
