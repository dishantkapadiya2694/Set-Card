//
//  ViewController.m
//  SetCardView
//
//  Created by Dishant Kapadiya on 9/2/16.
//  Copyright © 2016 Dishant Kapadiya. All rights reserved.
//

#import "SetCardViewController.h"
#import "SetCard.h"
#import "SetCardDeck.h"
#import "SetCardView.h"

@interface SetCardViewController ()

@property (strong, nonatomic) SetCardDeck *deck;
@property (weak, nonatomic) IBOutlet SetCardView *cardView;

@end

@implementation SetCardViewController

-(Deck *)deck
{
    if(!_deck) _deck = [[SetCardDeck alloc] init];
    return _deck;
}

-(void) drawRandomCard
{
    Card *card = [self.deck drawRandomCard];
    if([card isKindOfClass:[SetCard class]]) {
        SetCard *setCard = (SetCard *)card;
        self.cardView.symbol = setCard.symbol;
        self.cardView.count = setCard.count;
        self.cardView.shading = setCard.shading;
        self.cardView.color = setCard.color;
    }
}

- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    if(self.cardView.selected) [self drawRandomCard];
    self.cardView.selected = !self.cardView.selected;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.cardView action:@selector(pinch:)]];
}


@end
