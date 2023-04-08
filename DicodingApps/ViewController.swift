//
//  ViewController.swift
//  DicodingApps
//
//  Created by Ariq Hikari on 03/04/23.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlet dari TableView
    @IBOutlet weak var academyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Untuk menyediakan data ke TableView
        academyTableView.dataSource = self
        academyTableView.delegate = self
        
        // Mendaftarkan XIB ke ViewController
        academyTableView.register(
            UINib(nibName: "AcademyTableViewCell", bundle: nil),
            forCellReuseIdentifier: "AcademyCell"
        )
    }

    @IBAction func goToWebsite(_ sender: Any) {
        let urlDicoding = "https://www.dicoding.com"
        if let url = URL(string: urlDicoding), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}

// Mengimplementasikan UITableViewDataSource ke dalam ViewController
extension ViewController: UITableViewDataSource {
    
    // Mengetahui berapa banyak item yang akan muncul
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Mendapatkan jumlah item dari dummyAcademyData
        return dummyAcademyData.count
    }
    
    // Mengatur bagaimana tampilan dari setiap TableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Mencari AcademyTableViewCell berdasarkan Identifier
        if let cell = tableView.dequeueReusableCell(
          withIdentifier: "AcademyCell",
          for: indexPath
        ) as? AcademyTableViewCell {
            // Menetapkan nilai gambar dan nama untuk setiap cell/item.
            let academy = dummyAcademyData[indexPath.row]
            cell.academyLabel.text = academy.name
            cell.academyImageView.image = academy.image
            cell.descriptionLabel.text = academy.description
            
            // Mengembalikan cell agar bisa ditampilkan dalam TableView.
            return cell
        } else {
            // Mengembalikan UITableViewCell jika tidak ditemukan.
            return UITableViewCell()
        }
    }
    
 
}

// Mengimplementasikan UITableViewDelegate ke dalam ViewController
extension ViewController: UITableViewDelegate {
    // Merespon ketika Table View Cell ditekan.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Menambahkan trigger untuk segue ketika Table View Cell ditekan.
        performSegue(withIdentifier: "moveToDetail", sender: dummyAcademyData[indexPath.row])
    }
    
    override func prepare(
      for segue: UIStoryboardSegue,
      sender: Any?
    ) {
      if segue.identifier == "moveToDetail" {
        if let detaiViewController = segue.destination as? DetailViewController {
          detaiViewController.academy = sender as? AcademyModel
        }
      }
    }
}
