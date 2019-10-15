//
//  Observable+ObjectMapper.swift
//
//  Created by Ivan Bruel on 09/12/15.
//  Copyright © 2015 Ivan Bruel. All rights reserved.
//

import Foundation
import Moya
import HandyJSON

public extension Response {
    func mapObject<T: HandyJSON>(_ type: T.Type) throws -> T {
        //判断code
        guard let json = try mapJSON() as? [String: Any], let object = T.deserialize(from: json) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
}
