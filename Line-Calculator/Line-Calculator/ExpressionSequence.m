//
//  ExpressionSequence.m
//  Line-Calculator
//
//  Created by Victor Macintosh on 22/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#include <math.h>
#import "ExpressionSequence.h"

@interface ExpressionSequence()

- (void)sortingExpressions:(NSMutableArray *)exprs;
- (void)add:(Expression *)expression;

@end

@implementation ExpressionSequence

- (id)init {
    self = [super init];
    if (self) {
        _expressions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)sortingExpressions:(NSMutableArray *)exprs {
    NSUInteger i = 0;
    while(i < [exprs count]) {
        Expression *currExpr = exprs[i];
        MathOperationType currOperation = [currExpr operation];
        
        Expression *expr = [[Expression alloc] init];
        [expr setNum1:[currExpr num1]];
        [expr setOperation:[currExpr operation]];
        
        if (currOperation != MathOperationTypePow) {
            if (i < ([exprs count]) - 1) {
                MathOperationType nextOperation = [exprs[i + 1] operation];
                if ((currOperation < 2 && nextOperation >= 2) || ((currOperation == 2 || currOperation == 3) && (nextOperation == 4))) {
                    NSMutableArray *priorityPairs = [[NSMutableArray alloc] init];
                    i++;
                    while(i < [exprs count] && [exprs[i] operation] >= 2) {
                        Expression *currPriorityExpr = exprs[i];
                        Expression *priorityExpr = [[Expression alloc] init];
                        [priorityExpr setNum1:[currPriorityExpr num1]];
                        [priorityExpr setNum2:[currPriorityExpr num2]];
                        [priorityExpr setOperation:[currPriorityExpr operation]];
                        [priorityExpr setPrev:[priorityPairs lastObject]];
                        [[priorityExpr prev] setNext:priorityExpr];
                        [priorityPairs addObject:priorityExpr];
                        [priorityExpr release];
                        i++;
                    }
                    ExpressionSequence *priorityExpressionSequence = [[ExpressionSequence alloc] init];
                    [priorityExpressionSequence sortingExpressions:priorityPairs];
                    [expr setPriorityExpressionSequence: priorityExpressionSequence];
                    [priorityExpressionSequence release];
                    [priorityPairs release];
                } else {
                    [expr setNum2:[currExpr num2]];
                    i++;
                }
            } else {
                [expr setNum2:[currExpr num2]];
                i++;
            }
        } else if ([currExpr operation] == MathOperationTypePow) {
            [expr setNum2:[currExpr num2]];
            i++;
        }
        [expr setPrev:[[self expressions] lastObject]];
        [[expr prev] setNext:expr];
        [[self expressions] addObject:expr];
        [expr release];
    }
}

- (NSNumber *)solve {
    
    Expression *head = [[self expressions] firstObject];
    double num1 = 0;
    double num2 = 0;
    double result = 0;
    
    while(head) {
        if ([head prev]) {
            num1 = result;
        } else {
            num1 = [[head num1] doubleValue];
        }
        if ([head priorityExpressionSequence]) {
            NSNumber *res = [[head priorityExpressionSequence] solve];
            num2 = [res doubleValue];
        } else {
            num2 = [[head num2] doubleValue];
        }
        MathOperationType currentOperation = [head operation];
        switch (currentOperation) {
            case MathOperationTypeAdd:
                result = num1 + num2;
                break;
            case MathOperationTypeSubtract:
                result = num1 - num2;
                break;
            case MathOperationTypeMultiply:
                result = num1 * num2;
                break;
            case MathOperationTypeDevide:
                result = num1 / num2;
                break;
            case MathOperationTypePow:
                result = pow(num1, num2);
                break;
            default:
                break;
        }
        head = [head next];
    }
    return [NSNumber numberWithDouble:result];
}

- (void)add:(Expression *)expression {
    [[self expressions] addObject:expression];
}

- (void)dealloc {
    [_result release];
    [_expressions release];
    [super dealloc];
}

@end
