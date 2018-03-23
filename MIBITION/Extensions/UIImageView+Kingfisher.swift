//
//  UIImageView+Kingfisher.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/14/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import UIKit
import Kingfisher
import RxCocoa
import RxSwift
extension UIImageView {
    func download(imageUrl: String) {
        guard let imageUrl = URL(string: imageUrl) else {
            return
        }
        self.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: 60)
        self.kf.setImage(with: ImageResource(downloadURL: imageUrl), options: [.transition(.fade(0.2)), .processor(processor)])
    }
}

extension Reactive where Base: UIImageView {
    var imageURL: Binder<String> {
        return Binder(base) { (view, url) in
            view.download(imageUrl: url)
        }
    }
}
