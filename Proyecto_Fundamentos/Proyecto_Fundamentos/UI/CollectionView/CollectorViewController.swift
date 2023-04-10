//
//  CollectorViewController.swift
//  Proyecto_Fundamentos
//
//  Created by Rubén Pulido Marchal on 10/4/23.
//

import UIKit

class CollectorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let customRows = [
            CustomItem(image: UIImage(systemName: "pencil.circle")!, text: "lunes"),
            CustomItem(image: UIImage(systemName: "trash.circle")!, text: "martes"),
            CustomItem(image: UIImage(systemName: "folder.circle")!, text: "miércoles"),
            CustomItem(image: UIImage(systemName: "paperplane.circle")!, text: "jueves"),
            CustomItem(image: UIImage(systemName: "doc.circle")!, text: "viernes"),
            CustomItem(image: UIImage(systemName: "terminal")!, text: "sábado"),
            CustomItem(image: UIImage(systemName: "book.closed")!, text: "domingo")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let xib = UINib(nibName: "CollectionCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "customCollectionCell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customRows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath) as! CollectionCell
        let customItem = customRows[indexPath.row]
        cell.iconImageView.image = customItem.image
        cell.titleLabel.text = customItem.text
        
        return cell
    }
    // Funcion que sirve para marcar el número de celdas de la View
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsInRow: CGFloat = 2     ///al definir la variable si le pones CGFloat le "obligas" a que sea un Float
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = (itemsInRow - 1) * spacing
        let finalWidth = (collectionView.frame.width - totalSpacing) / itemsInRow
        
        return CGSize(width: finalWidth, height: 120)
        
    }
}