//
//  Expression.m
//  Line-Calculator
//
//  Created by Victor Macintosh on 22/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "Expression.h"

@implementation Expression

- (void)dealloc
{
    [_num1 release];
    [_num2 release];
    [_next release];
    [_priorityExpressionSequence release];
    [super dealloc];
}

@end
