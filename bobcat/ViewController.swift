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
    func loadPage(urlString: String)
    {
        mainView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: ("http://" + urlBox.stringValue))!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.frameLoadDelegate = self
    }
    
    func webViewDidFinishLoadForFrame(frame: WebFrame!)
    {
        print("AGA")
        loadPage("steam.com")
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

