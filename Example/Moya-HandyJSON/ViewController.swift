//
//  ViewController.swift
//  Moya-HandyJSON
//
//  Created by Adrift001 on 10/15/2019.
//  Copyright (c) 2019 Adrift001. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import Moya_HandyJSON

class ViewController: UIViewController {

    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let provider = MoyaProvider<Httpbin>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.rx.request(.ip).mapObject(IP.self).flatMap { (model) -> Single<IP> in
            return provider.rx.request(.ip).mapObject(IP.self)
        }.subscribe(onSuccess: { (model) in
            print(model.origin)
        }).disposed(by: bag)
    }

}

