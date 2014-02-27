//
//  Deck.m
//  Practice
//
//  Created by Moser, Wesley on 2/15/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "Deck.h"

@implementation Deck

- (void)addCard:(Card *)c atTop:(BOOL)top
{
    if (top)
        [cards insertObject:c atIndex:0];
    else
        [cards addObject:c];
}

- (void)addCard:(Card *)c
{
    [self addCard:c atTop:NO];
}

- (Card *)drawRandomCard
{
    u_int32_t index = arc4random() % [cards count];
    Card *toReturn = [cards objectAtIndex:index];
    [cards removeObjectAtIndex:index];
    return toReturn;
}

- (NSMutableArray *)cards
{
    if (!cards)
        cards = [[NSMutableArray alloc] init];
    
    return cards;
}

@end
