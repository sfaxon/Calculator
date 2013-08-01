//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Seth Faxon on 6/14/13.
//  Copyright (c) 2013 Seth Faxon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)currentAverage;
- (void)clearState;

@end
