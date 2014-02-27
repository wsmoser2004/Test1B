//
//  Card.m
//  Practice
//
//  Created by Moser, Wesley on 2/15/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)init
{
    self = [super init];
    self.chosen = NO;
    return self;
}

- (int)match:(Card *)aCard
{
    if ([aCard.contents isEqualToString:self.contents] &&
        aCard.matched == self.matched &&
        aCard.chosen == self.chosen)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

@end
