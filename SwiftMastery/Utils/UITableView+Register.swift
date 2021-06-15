//
//  UITableView+Register.swift
//  SwiftMastery
//
//  Created by Sean.Yue on 2021/2/25.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) {
        self.register(cellType, forCellReuseIdentifier: cellType.className)
    }
    
    func register<T: UITableViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }
    
    func registerNib<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let nib = UINib(nibName: cellType.className, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: cellType.className)
    }
    
    func registerNib<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { registerNib(cellType: $0, bundle: bundle)}
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}

/* Notes:
 T.Type is used in parameters and constraints to mean "the type of the thing itself, not an instance of the thing
 e.g.
 class Example {
     static var staticVar: String { return "Foo" }
     var instanceVar: String { return "Bar" }
 }

 func printVar(from example: Example) {
     print(example.instanceVar)  // "Bar"
     print(example.staticVar) // Doesn't compile, _Instances_ of Example don't have the property "staticVar"
 }

 func printVar(from example: Example.Type) {
     print(example.instanceVar)  // Doesn't compile, the _Type_ Example doesn't have the property "instanceVar"
     print(example.staticVar) // prints "Foo"
 }
 */
