//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Ken Krippeler on 04.07.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://img.discogs.com/Pqh5Qcgy22BiJNU4qVEP4qOToBU=/fit-in/600x596/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-1334197-1396061230-9900.jpeg.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/DyDRXbP1MaY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Genesis - Follow You Follow Me")
        let p2 = PartyRock(imageURL: "https://images-na.ssl-images-amazon.com/images/M/MV5BMjAwMzkyZWQtZjYwMy00YmIzLTk5NzUtMjJjNTY0NWQwOTA1XkEyXkFqcGdeQXVyNTk1NTMyNzM@._V1_SX1777_CR0,0,1777,932_AL_.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/khg2sloLzTI\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Genesis - That's All")
        let p3 = PartyRock(imageURL: "https://s-media-cache-ak0.pinimg.com/236x/54/29/d1/5429d193edce9dc0992fed6bdcaacd23--phil-collins-confusion.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/epOBenUjIHw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Genesis - Invisible Touch")
        let p4 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/c/c9/Phil_Collins_InTheAirTonight.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/YkADj0TPrJA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Phil Collins - In The Air Tonight")
        let p5 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/5/53/Phil_Collins_AnotherDayInParadise.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Qt2mbGP6vFI\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Phil Collins - Another Day In Paradise")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell
        {
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destination = segue.destination as? VideoVC, let party = sender as? PartyRock
        {
            destination.partyRock = party
        }
    }

}

