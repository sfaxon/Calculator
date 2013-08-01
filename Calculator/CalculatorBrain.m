//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Seth Faxon on 6/14/13.
//  Copyright (c) 2013 Seth Faxon. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack
{
    // lazy init of operandStack
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void)pushOperand:(double)operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (void)clearState
{
    [self.operandStack removeAllObjects];
}

- (double)currentAverage
{
    double total = 0;
    double result = 0;

    for (NSNumber *operand in [self operandStack]) {
        total += operand.doubleValue;
    }
    NSInteger size = [[self operandStack] count];
    result = total / size;
    
    return result;
}

@end
