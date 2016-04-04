//
//  Playlist.swift
//  AlgoRhythym
//
//  Created by Angel Caro on 3/28/16.
//  Copyright © 2016 AngelCaro. All rights reserved.
//

import Foundation
import UIKit

struct Playlist {
    
    var title: String?
    var description: String?
    var icon: UIImage?
    var largeIcon: UIImage?
    var artists: [String] = []
    var backgroundColor: UIColor = UIColor.clearColor()
    
    init(index: Int) {
        
        let musicLibrary = MusicLibrary().library
        let playListDictionary = musicLibrary[index]
        
        title = playListDictionary["title"] as? String
        description = playListDictionary["description"] as? String
        
        let iconName = playListDictionary["icon"] as? String
        icon = UIImage(named: iconName!)
        
        let largeIconName = playListDictionary["largeIcon"] as? String
        largeIcon = UIImage(named: largeIconName!)
        
        artists += playListDictionary["artists"] as! [String]
        
        let colorsDictionary = playListDictionary["backgroundColor"] as! [String: CGFloat]
        backgroundColor = rgbColorFromDictionary(colorsDictionary)
        
    }
    
    func rgbColorFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {
        
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
        
    }
    
}