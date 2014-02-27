//
//  Card.h
//  Practice
//
//  Created by Moser, Wesley on 2/15/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

- (int)match:(Card *)aCard;

@property (nonatomic, strong) NSString *contents;
@property (nonatomic) BOOL matched;
@property (nonatomic) BOOL chosen;

@end
