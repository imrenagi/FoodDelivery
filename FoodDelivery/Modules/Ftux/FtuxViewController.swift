//
//  FtuxViewController.swift
//  FoodDelivery
//
//  Created by Imre Nagi on 08/06/22.
//

import UIKit

let data: [Ftux] = [
    Ftux(image: "img_ftux_1", title: "Find Food You Love", subTitle: "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"),
    Ftux(image:"img_ftux_2", title: "Fast Delivery", subTitle: "Fast food delivery to your home, office wherever you are"),
    Ftux(image: "img_ftux_3", title: "Live Tracking", subTitle: "Real time tracking of your food on the app once you placed the order")
]

class FtuxViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        nextButton.layer.cornerRadius = 25
        nextButton.clipsToBounds = true
        pageControl.numberOfPages = data.count
        updatePage(0)
    }
        
    func goToPage(_ page: Int) {
        collectionView.scrollToItem(at: IndexPath(item: page, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func updatePage(_ page: Int) {
        pageControl.currentPage = page
        nextButton.setTitle(page == data.count - 1 ? "Let's begin" : "Next", for: .normal)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton, forEvent event: UIEvent) {
        let page = pageControl.currentPage + 1
        if page < data.count  {
            updatePage(page)
            goToPage(page)
        }
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

extension FtuxViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ftuxCellId", for: indexPath) as! FtuxViewCell
        
        let cellData = data[indexPath.item]
        cell.img.image = UIImage(named: cellData.image)
        cell.titleLabel.text = cellData.title
        cell.subTitleLabel.text = cellData.subTitle
        
        return cell
    }
}

extension FtuxViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        updatePage(page)
    }
    
}

extension FtuxViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
