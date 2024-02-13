//
//  UIImageView+Kingfisher.swift
//  Cinetopia
//
//  Created by Pierre Campos Dias on 31/01/24.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFrom(for urlString: String?) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: urlString ?? "no-image"), placeholder: UIImage(named: "no-image"), options: [.transition(.fade(0.5))])
    }
}
