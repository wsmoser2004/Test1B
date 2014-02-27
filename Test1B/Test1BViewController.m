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

//- (Card *)getCardForButton:(id)button;
- (NSUInteger)getIndexOfCard:(id)sender;
- (void)updateMatchedCards;

@end

@implementation Test1BViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
    self.game = [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:deck];
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", self.game.score]];
    
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
    }
    else
    {
        [senderAsButton setTitle:@"" forState:UIControlStateNormal];
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

//- (Card *)getCardForButton:(id)button
//{
//    NSUInteger index = [self getIndexOfCard:button];
//    return [self.game getCardByIndex:index];
//}

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
