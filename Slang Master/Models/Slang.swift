//
//  Slangs.swift
//  Slang Master
//
//  Created by Kaichi Momose on 2017/10/19.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation
import UIKit

struct Slang{
    let word: String
    let mean: String
    let image: String
}

extension Slang: Equatable {
    static func ==(lhs: Slang, rhs: Slang) -> Bool {
        return lhs.word == rhs.word
    }
}
