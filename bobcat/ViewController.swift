//
//  ViewController.swift
//  bobcat
//
//  Created by Tom Hutchings on 24/04/2016.
//  Copyright © 2016 Tom Hutchings. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKNavigationDelegate, NSTextFieldDelegate {

    @IBOutlet weak var mainView: WebView!
    @IBOutlet weak var urlBox: NSTextField!
    
    func loadPage(urlString: String)
    {
        mainView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: ("http://" + urlBox.stringValue))!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        urlBox.stringValue = "apple.com"
        let url = NSURL(string: "https://www.apple.com")!
        let request = NSURLRequest(URL: url)
        
        mainView.mainFrame.loadRequest(request)
        
        //self.view.menu
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        self.view.window?.titleVisibility = NSWindowTitleVisibility.Hidden
        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.styleMask |= NSFullSizeContentViewWindowMask
    }

    @IBAction func textFieldChanged(sender: NSTextField)
    {
        loadPage(sender.stringValue)
    }
}

