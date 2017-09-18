//
//  CalculatorModel.swift
//  uitest
//
//  Created by michael chan on 2017/9/19.
//  Copyright © 2017年 michael chan. All rights reserved.
//

import Foundation

class CalculatorModel {
    func setLeft(operand: Double){
        accumulator = operand
    }
    func performOperation(symbol: String){
        
    }
    var result: Double{
        get{
            return accumulator
        }
    }
    var accumulator = 0.0
}
