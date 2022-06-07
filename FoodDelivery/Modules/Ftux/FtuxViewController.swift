//
//  FtuxViewController.swift
//  FoodDelivery
//
//  Created by Imre Nagi on 08/06/22.
//

import UIKit

class FtuxViewController: UIViewController {

//    TODO add array of object to store the data for each swipe
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        nextButton.layer.cornerRadius = 25
        nextButton.clipsToBounds = true
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton, forEvent event: UIEvent) {
        img.image = UIImage(named: "img_ftux_2")
        titleLabel.text = "Fast Delivery"
        subTitleLabel.text = "Fast food delivery to your home, office wherever you are"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
