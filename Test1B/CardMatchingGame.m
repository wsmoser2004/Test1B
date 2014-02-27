//
//  CardMatchingGame.m
//  Test1B
//
//  Created by Moser, Wesley on 2/27/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"
#import "Card.h"
#import "PlayingCardDeck.h"

@interface CardMatchingGame ()
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, readwrite) NSInteger score;

- (Card *)getChosenCardMatchingInSuit:(Card *)c;
- (Card *)getChosenCardMatchingInRank:(Card *)c;
- (BOOL)anotherCardIsChosenButNotMatched;

@end

const NSInteger RANK_MATCH_SCORE = 12;
const NSInteger SUIT_MATCH_SCORE = 4;
const NSInteger FLIP_PENALTY = 1;
const NSInteger SECOND_FLIP_PENALTY = 2;

@implementation CardMatchingGame

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self)
    {
        self.cards = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < count; i++)
        {
            [self.cards addObject:[deck drawRandomCard]];
        }
    }
    return self;
}


- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *c = [self.cards objectAtIndex:index];
    
    if (c.chosen)
    {
        c.chosen = NO;
    }
    else
    {
        Card *match;
        if ((match = [self getChosenCardMatchingInRank:((PlayingCard *)c)]) != nil)
        {
            match.matched = true;
            c.matched = true;
            self.score += RANK_MATCH_SCORE;
        }
        else if ((match = [self getChosenCardMatchingInSuit:((PlayingCard *)c)]) != nil)
        {
            match.matched = true;
            c.matched = true;
            self.score += SUIT_MATCH_SCORE;
        }
        else if ([self anotherCardIsChosenButNotMatched])
        {
            self.score -= SECOND_FLIP_PENALTY;
            self.score -= FLIP_PENALTY;
        }
        else
        {
            self.score -= FLIP_PENALTY;
        }
        c.chosen = YES;
    }
}

- (PlayingCard *)getChosenCardMatchingInSuit:(PlayingCard *)c
{
    for (PlayingCard *other in self.cards)
    {
        if (other != c && other.chosen && !other.matched && [other.suit isEqualToString:c.suit])
            return other;
    }
    return nil;
}

- (PlayingCard *)getChosenCardMatchingInRank:(PlayingCard *)c
{
    for (PlayingCard *other in self.cards)
    {
        if (other != c && other.chosen && !other.matched && other.rank == c.rank)
            return other;
    }
    return nil;
}

- (BOOL)anotherCardIsChosenButNotMatched
{
    for (Card *c in self.cards)
    {
        if (c.chosen && !c.matched)
            return YES;
    }
    return NO;
}

- (Card *)getCardByIndex:(NSUInteger)index
{
    return [self.cards objectAtIndex:index];
}

@end
