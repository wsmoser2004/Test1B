//
//  Test1BViewController.m
//  Test1B
//
//  Created by Moser, Wesley on 2/27/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "Test1BViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface Test1BViewController ()

@property (nonatomic, strong) CardMatchingGame *game;

- (NSUInteger)getIndexOfCard:(id)sender;
- (void)updateMatchedCards;
- (UIImage *)getBackgroundImage;

@end

@implementation Test1BViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
    self.game = [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:deck];
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", self.game.score]];
    
    for (UIButton *b in self.buttons)
    {
        [b setBackgroundImage:[self getBackgroundImage] forState:UIControlStateNormal];
    }
}

- (UIImage *)getBackgroundImage
{
    return [UIImage imageNamed:@"morback.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cardTapped:(id)sender
{
    UIButton *senderAsButton = (UIButton *)sender;
    [self.game chooseCardAtIndex:[self getIndexOfCard:sender]];
    Card *c = [self.game getCardByIndex:[self getIndexOfCard:sender]];
    
    if (c.chosen)
    {
        [senderAsButton setTitle:c.contents forState:UIControlStateNormal];
        [senderAsButton setBackgroundImage:nil forState:UIControlStateNormal];
    }
    else
    {
        [senderAsButton setTitle:@"" forState:UIControlStateNormal];
        [senderAsButton setBackgroundImage:[self getBackgroundImage] forState:UIControlStateNormal];
    }
    
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", self.game.score]];
    [self updateMatchedCards];
}

- (void)updateMatchedCards
{
    for (int i = 0; i < [self.buttons count]; i++)
    {
        if ([self.game getCardByIndex:i].matched)
        {
            [self.buttons[i] setEnabled:NO];
            [self.buttons[i] setBackgroundColor:[UIColor lightGrayColor]];
        }
    }
}

- (NSUInteger)getIndexOfCard:(id)sender
{
    NSUInteger i = 0;
    for (UIButton *b in self.buttons)
    {
        if (sender == b)
            return i;
        i++;
    }
    return -1;
}

@end
