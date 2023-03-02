//
//  LoadImageCell.swift
//  Wanted-Freeonboarding
//
//  Created by 조석진 on 2023/03/02.
//

import UIKit

class LoadImageCell: UITableViewCell  {
    @IBOutlet weak var loadImage: UIImageView!
    @IBOutlet weak var LoadImageBtn: UIButton!
    var imageURL = URL(string: "")
    @IBAction func loadImage(_ sender: Any) {
        loadImage.image = UIImage(systemName: "photo")
        loadImage.load(url: imageURL!)
    }
}
