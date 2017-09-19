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
    struct Pending{
        var binaryFunction: (Double,Double) -> Double
        var leftOperant : Double
    }
    var pending : Pending?
    enum Operation{
        case Constant(Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
    }
    var operation: Dictionary<String, Operation> = [
        "e" : Operation.Constant(M_E),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "x" : Operation.BinaryOperation({$0 * $1}),
        "-" : Operation.BinaryOperation({$0 - $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "=" : Operation.Equals
    ]
    func performOperation(symbol: String){
        if let constant = operation[symbol]{
            switch constant {
            case .Constant(let associatedConstantValue): accumulator = associatedConstantValue
            case .BinaryOperation(let function):equal()
                                                pending = Pending(binaryFunction: function, leftOperant: accumulator)
            case .Equals: equal()
            default: break
            }
        }
        
    }
    
    func equal(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.leftOperant, accumulator)
            pending = nil
        }
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
    var accumulator = 0.0
    func clear(){
        pending = nil
        accumulator = 0.0
    }
}
