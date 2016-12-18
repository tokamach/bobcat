//
//  ViewController.swift
//  bobcat
//
//  Created by Tom Hutchings on 24/04/2016.
//  Copyright © 2016 Tom Hutchings. All rights reserved.
//

import Cocoa
import WebKit
import VideoToolbox

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
        mainView.mainFrame.load(URLRequest(url: URL(string: ("http://" + urlBox.stringValue))!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.frameLoadDelegate = self
    }
    
    func webViewDidFinishLoadForFrame(_ frame: WebFrame!)
    {
        print("AGA")
        loadPage("google.com")
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

