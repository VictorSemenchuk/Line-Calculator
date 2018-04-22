//
//  LineCalculator.m
//  Line-Calculator
//
//  Created by Victor Macintosh on 22/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "LineCalculator.h"

@interface LineCalculator()

@property (retain, nonatomic) NSNumber *value;
@property (retain, nonatomic) NSMutableArray *pairs;
@property (retain, nonatomic) ExpressionSequence *exprSequence;

- (NSNumber *)result;
- (void)addPair:(NSNumber *)num1 with:(NSNumber *)num2 and:(MathOperationType)operation;

@end

@implementation LineCalculator

+ (LineCalculator *)defaultValue:(NSInteger)value {
    LineCalculator *calc = [[[LineCalculator alloc] init] autorelease];
    [calc setValue:[NSNumber numberWithLong:value]];
    return calc;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _pairs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (LineCalculator *)add:(NSInteger)value {
    NSNumber *nextValue = [NSNumber numberWithLong:value];
    [self addPair:[NSNumber numberWithInt:[_value doubleValue]] with:nextValue and:MathOperationTypeAdd];
    _value = nextValue;
    return self;
}

- (LineCalculator *)subtract:(NSInteger)value {
    NSNumber *nextValue = [NSNumber numberWithLong:value];
    [self addPair:[NSNumber numberWithInt:[_value doubleValue]] with:nextValue and:MathOperationTypeSubtract];
    _value = nextValue;
    return self;
}

- (LineCalculator *)multiply:(NSInteger)value {
    NSNumber *nextValue = [NSNumber numberWithLong:value];
    [self addPair:[NSNumber numberWithInt:[_value doubleValue]] with:nextValue and:MathOperationTypeMultiply];
    _value = nextValue;
    return self;
}

- (LineCalculator *)devide:(NSInteger)value {
    NSNumber *nextValue = [NSNumber numberWithLong:value];
    [self addPair:[NSNumber numberWithInt:[_value doubleValue]] with:nextValue and:MathOperationTypeDevide];
    _value = nextValue;
    return self;
}

- (LineCalculator *)pow:(NSInteger)value {
    NSNumber *nextValue = [NSNumber numberWithLong:value];
    [self addPair:[NSNumber numberWithInt:[_value doubleValue]] with:nextValue and:MathOperationTypePow];
    _value = nextValue;
    return self;
}

- (NSNumber *)result {
    return [self value];
}

- (void)addPair:(NSNumber *)num1 with:(NSNumber *)num2 and:(MathOperationType)operation {
    Expression *expr = [[[Expression alloc] init] autorelease];
    [expr setNum1:num1];
    [expr setNum2:num2];
    [expr setOperation:operation];
    [_pairs addObject:expr];
}

- (NSString *)description
{
    ExpressionSequence *exprSequence = [[ExpressionSequence alloc] init];
    [exprSequence sortingExpressions:[self pairs]];
    [self setExprSequence:exprSequence];
    [exprSequence release];
    return [NSString stringWithFormat:@"%@", [[self exprSequence] solve]];
}

-(void)dealloc {
    [_value release];
    [_pairs release];
    [_exprSequence release];
    [super dealloc];
}

@end
