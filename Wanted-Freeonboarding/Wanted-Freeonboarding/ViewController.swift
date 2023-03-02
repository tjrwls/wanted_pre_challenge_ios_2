//
//  ViewController.swift
//  Wanted-Freeonboarding
//
//  Created by 조석진 on 2023/03/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let imagesURL = [
        URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqFJOCpjzGtZtpWfQg0CN5rT0bfjEhOQ0j5w&usqp=CAU"),
        URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqAYcRM8wulNwD9JWB_WMOFaIEUX6A6bB5lA&usqp=CAU"),
        URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn4SI6-gNV_gwmNURqySnSemqOzbeIHmISpg&usqp=CAU"),
        URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7B86CWKuBXAxgx-KynpEiNBlOc_Kaxa7WCQ&usqp=CAU"),
        URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf1bIIPOkf36NbCVsxbANB0d82fqVptx30wA&usqp=CAU")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        registerXib()
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "LoadImageCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "LoadImageCell")
    }
    
    @IBAction func LoadAllImagesBtn(_ sender: Any) {
        for index in (0...4) {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! LoadImageCell
            cell.loadImage.image = UIImage(systemName: "photo")
        }
        
        for index in (0...4).reversed() {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! LoadImageCell
            cell.loadImage.load(url: imagesURL[index]!)
        }
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesURL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoadImageCell", for: indexPath) as! LoadImageCell
        cell.loadImage.image = UIImage(systemName: "photo")
        cell.imageURL = imagesURL[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}

