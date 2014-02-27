//
//  CardMatchingGame.h
//  Test1B
//
//  Created by Moser, Wesley on 2/27/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;
@class Deck;

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)getCardByIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
