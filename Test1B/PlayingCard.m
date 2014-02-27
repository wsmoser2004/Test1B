//
//  PlayingCard.m
//  Practice
//
//  Created by Moser, Wesley on 2/15/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (NSString *)getSuit
{
    if (_suit)
        return _suit;
    else
        return @"?";
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
        _suit = suit;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank < [PlayingCard maxRank])
        _rank = rank;
}

- (NSString *)rankStrings:(NSUInteger)rank
{
    if (rank == 1)
        return @"A";
    else if (rank > 1 && rank < 10)
        return [NSString stringWithFormat:@"%c", ('0' + (int)rank)];
    else if (rank == 10)
        return @"10";
    else if (rank == 11)
        return @"J";
    else if (rank == 12)
        return @"Q";
    else if (rank == 13)
        return @"K";
    else  // rank == 0 or anything else
        return @"?";
}

- (NSString *)contents
{
    return [NSString stringWithFormat:@"%@ %@", [self rankStrings:self.rank], self.suit];
}

+ (NSUInteger)maxRank
{
    return 13;
}

+ (NSArray *)validSuits;
{
    return [NSArray arrayWithObjects:@"♠️", @"♥️", @"♣️", @"♦️", nil];
}

@end
