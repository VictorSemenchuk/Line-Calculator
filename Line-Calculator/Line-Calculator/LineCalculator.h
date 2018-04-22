//
//  LineCalculator.h
//  Line-Calculator
//
//  Created by Victor Macintosh on 22/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expression.h"
#import "ExpressionSequence.h"

@interface LineCalculator : NSObject

+ (LineCalculator *)defaultValue:(NSInteger)value;

- (LineCalculator *)add:(NSInteger)value;
- (LineCalculator *)subtract:(NSInteger)value;
- (LineCalculator *)multiply:(NSInteger)value;
- (LineCalculator *)devide:(NSInteger)value;
- (LineCalculator *)pow:(NSInteger)value;

@end
