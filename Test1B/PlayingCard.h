//
//  PlayingCard.h
//  Practice
//
//  Created by Moser, Wesley on 2/15/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (int)maxRank;

- (void)setSuit:(NSString *)suit;
- (NSString *)getSuit;
- (void)setRank:(NSUInteger)rank;
- (NSString *)rankStrings:(NSUInteger)rank;
- (NSString *)contents;

@end
