//
//  Deck.h
//  Practice
//
//  Created by Moser, Wesley on 2/15/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
{
    NSMutableArray *cards;
}

- (void)addCard:(Card *)c atTop:(BOOL)top;
- (void)addCard:(Card *)c;
- (Card *)drawRandomCard;
- (NSMutableArray *)cards;

@end
