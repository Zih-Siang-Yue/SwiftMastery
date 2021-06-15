//
//  Function.swift
//  SwiftMastery
//
//  Created by Sean.Yue on 2021/2/26.
//

import Foundation

protocol FunctionProtocol {
    var functionNames: [String] { get }
}

//Covert String into Class
struct Function {

    let practice: Practicable
    
//    init(with funcName: String) {
//        self.practice = convert(with: funcName)
//    }
//
//    func convert(with name: String) -> Practicable {
//        let clsIns: AnyClass? = Bundle.main.classNamed(name)
//        guard let instance = clsIns else {
//            return RangePratice()
//        }
//        print("class instance: \(instance)")
//        return instance as! Practicable
////        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
////        let cls = NSClassFromString("\(namespace).\(name)")! as! Practicable.Type
////        return cls.init()   //Practicable 不是class/struct 不能init
//    }
}
