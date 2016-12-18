//
//  ViewController.swift
//  bobcat
//
//  Created by Tom Hutchings on 24/04/2016.
//  Copyright © 2016 Tom Hutchings. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKNavigationDelegate, WebFrameLoadDelegate
{

    @IBOutlet weak var mainView: WebView!
    @IBOutlet weak var urlBox: NSTextField!
    
    // Should parse for http and www
    func loadPage(_ urlString: String)
    {
        var urlString = urlString
        let parser = URLParser()
        urlString = parser.parseURL(inputURL: urlString)
        mainView.mainFrame.load(URLRequest(url: URL(string: (urlString))!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.frameLoadDelegate = self
    }
    
    func webViewDidFinishLoadForFrame(_ frame: WebFrame!)
    {
//        loadPage("file:///Users/tom/code/index.html")
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        self.view.window?.titleVisibility = NSWindowTitleVisibility.hidden
        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.styleMask.insert(.fullSizeContentView)
    }

    @IBAction func textFieldChanged(_ sender: NSTextField)
    {
        loadPage(sender.stringValue)
    }
}

