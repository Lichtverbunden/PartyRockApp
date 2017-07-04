//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Ken Krippeler on 04.07.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class VideoVC: UIViewController
{
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock
    {
        get
        {
            return _partyRock
        }
        set
        {
            _partyRock = newValue
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        titleLabel.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }



}
