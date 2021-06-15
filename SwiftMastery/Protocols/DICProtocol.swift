//
//  DICProtocol.swift
//  SwiftMastery
//
//  Created by Sean.Yue on 2021/2/25.
//

import Foundation

protocol HasFunctionsProtocol {
    var functionData: FunctionProtocol { get }
}

protocol DICProtocol: HasFunctionsProtocol {
    func register<Service>(type: Service.Type, factoryClosure: @escaping FactoryClosure)
    func resolve<Service>(type: Service.Type) -> Service?
}
