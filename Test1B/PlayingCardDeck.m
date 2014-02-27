//
//  PlayingCardDeck.m
//  Practice
//
//  Created by Moser, Wesley on 2/15/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init
{
    self = [super init];
    if (self)
    {
        cards = [[NSMutableArray alloc] init];
        
        for (int i = 1; i < [PlayingCard maxRank]; i++)
        {
            for (NSString *suit in [PlayingCard validSuits])
            {
                PlayingCard *c = [[PlayingCard alloc] init];
                [c setSuit:suit];
                [c setRank:i];
                [self addCard:c];
            }
        }
    }
    return self;
}

@end
