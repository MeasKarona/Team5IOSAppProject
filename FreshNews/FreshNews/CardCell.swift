//
//  CardCell.swift
//  FreshNews
//
//  Created by MACBOOKAIR on 28/8/22.
//

import UIKit

class CardCell: UITableViewCell{

    
    @IBOutlet weak var lblHotNews: UILabel!
    @IBOutlet var cardContainer: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var picturebox: UIImageView!
    @IBOutlet var Title: UILabel!
    
    func configure(picture: String, title: String){
        guard let url =  URL(string: picture) else{
            return
        }
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        lblTitle.text = title
        picturebox.image = UIImage(data: data)
        lblHotNews.layer.cornerRadius = 25.0
    }
    
    
}
