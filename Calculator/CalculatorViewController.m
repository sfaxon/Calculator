//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Seth Faxon on 6/14/13.
//  Copyright (c) 2013 Seth Faxon. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    NSLog(@"digit pressed = %@", digit); // %@ means respond to description

    // UILabel *myDisplay = self.display; // [self display];
    // NSString *currentText = myDisplay.text; // [myDisplay text];
    // NSString *newText = [currentText stringByAppendingString:digit];
    // myDisplay.text = newText; // [myDisplay setText:newText];
    // simplified:
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)clearPressed:(UIButton *)sender {
    [self.brain clearState];
    [self updateUI];
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    [self updateUI];
}

- (void)updateUI {
    NSString *average = [NSString stringWithFormat:@"Average: %f", [self.brain currentAverage]];
    self.result.text = average;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
