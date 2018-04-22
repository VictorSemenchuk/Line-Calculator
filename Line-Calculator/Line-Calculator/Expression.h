//
//  Expression.h
//  Line-Calculator
//
//  Created by Victor Macintosh on 22/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MathOperationTypeAdd = 0,
    MathOperationTypeSubtract,
    MathOperationTypeMultiply,
    MathOperationTypeDevide,
    MathOperationTypePow
} MathOperationType;

@class ExpressionSequence;
@interface Expression : NSObject

@property (retain, nonatomic) NSNumber *num1;
@property (retain, nonatomic) NSNumber *num2;
@property (readwrite, nonatomic) MathOperationType operation;
@property (retain, nonatomic) Expression *next;
@property (weak, nonatomic) Expression *prev;
@property (retain, nonatomic) ExpressionSequence *priorityExpressionSequence;

@end
