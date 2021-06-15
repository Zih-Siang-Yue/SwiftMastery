//
//  DIC.swift
//  SwiftMastery
//
//  Created by Sean.Yue on 2021/2/25.
//

import Foundation

typealias FactoryClosure = (DIC) -> AnyObject

class DIC: DICProtocol {
    var services = Dictionary<String, FactoryClosure>()
    
    func register<Service>(type: Service.Type, factoryClosure: @escaping FactoryClosure) {
        services["\(type)"] = factoryClosure
    }
    
    func resolve<Service>(type: Service.Type) -> Service? {
        return services["\(type)"] as? Service //return services["\(type)"]?(self) as? Service <-- ?(self) 什麼意思
    }
}

extension DIC {
    var functionData: FunctionProtocol {
        return resolve(type: FunctionProtocol.self)!
    }
}
