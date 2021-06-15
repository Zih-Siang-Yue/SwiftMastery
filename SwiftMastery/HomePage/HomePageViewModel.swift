//
//  HomePageViewModel.swift
//  SwiftMastery
//
//  Created by Sean.Yue on 2021/2/25.
//

import Foundation

class HomePageViewModel: BaseViewModel, ViewModelType {
        
    typealias Input = HomePageInput
    typealias Output = HomePageOutput
    typealias Dependencies = HasFunctionsProtocol
    
    let dependencies: Dependencies
    let functions: [Function]
    var cellVMs: [[FunctionCellVM]]
    
    struct HomePageInput {
        
    }
    
    struct HomePageOutput {
        
    }
    
    init(with functions: [Function]) {
        self.functions = self.dependencies.function.
        super.init()
    }
    
    convenience init(dependencies: Dependencies) {
        self.dependencies = dependencies
        self
        
    }
    
}
