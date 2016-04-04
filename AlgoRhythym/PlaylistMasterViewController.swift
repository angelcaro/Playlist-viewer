//
//  ViewController.swift
//  AlgoRhythym
//
//  Created by Angel Caro on 3/28/16.
//  Copyright © 2016 AngelCaro. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {

    var playistsArray: [UIImageView] = []
   
    @IBOutlet weak var playListImageView0: UIImageView!
    @IBOutlet weak var playlistImageView1: UIImageView!
    @IBOutlet weak var playlistImageView2: UIImageView!
    @IBOutlet weak var playlistImageView3: UIImageView!
    @IBOutlet weak var playlistImageView4: UIImageView!
    @IBOutlet weak var playlistImageView5: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playistsArray += [playListImageView0,playlistImageView1, playlistImageView2, playlistImageView3, playlistImageView4, playlistImageView5]
        
        for index in 0..<playistsArray.count {
            
            let playlist = Playlist(index: index)
            let playlistImageView = playistsArray[index]
            
            playlistImageView.image = playlist.icon
            playlistImageView.backgroundColor = playlist.backgroundColor
            
        }
       
  
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlaylistDetailSegue" {
 
            let playlistImageView = sender!.view! as! UIImageView
            if let index = playistsArray.indexOf(playlistImageView) {
                
                let playlistDetailController = segue.destinationViewController as! PlaylistDetailViewController
                playlistDetailController.playlist = Playlist(index: index)

                
            }
            
        }
    }
    
    @IBAction func showPlaylistDetail(sender: AnyObject) {
        
        performSegueWithIdentifier("showPlaylistDetailSegue", sender: sender)
        
    }

}

