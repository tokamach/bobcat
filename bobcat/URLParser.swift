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
    let pattern: String
    
    init(_ pattern: String)
    {
        self.pattern = pattern
        self.internalExpression = NSRegularExpression.withPattern(pattern, options: .caseInsensitive)
    }
    
    func test(input: String) -> Bool
    {
        let matches = internalExpression.matchesInString(input, options: nil, range: NSMakeRange(0, input.characters.count))
        return matches.count > 0
    }
}

class URLParser
{
    public func parseURL(inputURL: String) -> String
    {
        let urlRegex = Regex(inputURL)
        if(urlRegex.test(input: "https://*"))
        {
            print("aga")
        }
        
    }
}
