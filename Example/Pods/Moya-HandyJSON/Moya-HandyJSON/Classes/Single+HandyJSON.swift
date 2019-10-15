//
//  Single+MoyaObjectMapper.swift
//
//  Created by Ivan Bruel on 09/12/15.
//  Copyright © 2015 Ivan Bruel. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import HandyJSON

public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
    func mapObject<T: HandyJSON>(_ type: T.Type) -> Single<T> {
        return flatMap {
            .just(try $0.mapObject(type))
        }
    }
}
