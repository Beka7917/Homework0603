//
//  ViewController.swift
//  Homework0603
//
//  Created by Бектур Кадыркулов on 17/4/23.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
 
    var phones: [Phone] = []
    
    
    
    private lazy var iphoneColletionView: UICollectionView   = {
        let layout = UICollectionViewLayout()
        let view = UICollectionView(frame: .zero,collectionViewLayout: layout)
        view.register(IphoneCell.self, forCellWithReuseIdentifier: IphoneCell.reuseld)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupSubView()
        fetchIphoneList { result in
            self.phones = result
        }
    }

    private func setupSubView(){
        view.addSubview(iphoneColletionView)
       iphoneColletionView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    func fetchIphoneList(completetion: @escaping ([Phone]) -> ()){
        let url = URL(string: "https://dummyjson.com/products")
        
        let request = URLRequest (url: url!)
        
        URLSession.shared.dataTask(with: request) { data , response,
            error in
         
            guard  let data = data , error == nil  else {
                return
            }
            
            do{
                let   result  = try JSONDecoder().decode([Phone].self, from: data)
                
                     print(result)
            }catch {
                     print(error)
            }
            
            
        }.resume()
    }
}


extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IphoneCell.reuseld, for: indexPath) as! IphoneCell
        cell.fill(phone: phones[indexPath.row])
        return cell
    }
    
    
}

extension ViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 400)
    }
}
