//
//  FtuxViewController.swift
//  FoodDelivery
//
//  Created by Imre Nagi on 08/06/22.
//

import UIKit

struct FtuxData {
    var image: String
    var title: String
    var subTitle: String
}

class FtuxViewController: UIViewController {

//    TODO add array of object to store the data for each swipe
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    let data: [FtuxData] = [
        FtuxData(image: "img_ftux_1", title: "Find Food You Love", subTitle: "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"),
        FtuxData(image:"img_ftux_2", title: "Fast Delivery", subTitle: "Fast food delivery to your home, office wherever you are"),
        FtuxData(image: "img_ftux_3", title: "Live Tracking", subTitle: "Real time tracking of your food on the app once you placed the order")
    ]
    var currPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        nextButton.layer.cornerRadius = 25
        nextButton.clipsToBounds = true
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton, forEvent event: UIEvent) {
        currPage += 1
        if currPage < data.count {
            setData(data: data[currPage])
        }
    }
    
    func setData(data: FtuxData) {
        img.image = UIImage(named: data.image)
        titleLabel.text = data.title
        subTitleLabel.text = data.subTitle
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
