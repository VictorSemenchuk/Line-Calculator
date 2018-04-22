//
//  ExpressionSequence.h
//  Line-Calculator
//
//  Created by Victor Macintosh on 22/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expression.h"

@interface ExpressionSequence : NSObject

@property (retain, nonatomic) NSNumber *result;
@property (retain, nonatomic) NSMutableArray *expressions;

- (void)sortingExpressions:(NSMutableArray *)exprs;
- (NSNumber *)solve;

@end
