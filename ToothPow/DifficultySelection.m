//
//  DifficultySelection.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 28-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "DifficultySelection.h"
#import "GameScreen.h"

@interface DifficultySelection ()
@property(nonatomic,strong) NSNumber *difficulty;
@end

@implementation DifficultySelection
@synthesize difficulty = _difficulty;

- (IBAction)beginEasy:(UIButton *)sender {
    self.difficulty = [NSNumber numberWithInt: 0];
    [self performSegueWithIdentifier:@"beginGame" sender:self];
}

- (IBAction)beginNormal:(UIButton *)sender {
    self.difficulty = [NSNumber numberWithInt:1];
    [self performSegueWithIdentifier:@"beginGame" sender:self];

}

- (IBAction)beginHard:(UIButton *)sender {
    self.difficulty = [NSNumber numberWithInt:2];
    [self performSegueWithIdentifier:@"beginGame" sender:self];

}

- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    GameScreen *gameplay = segue.destinationViewController;
    
    gameplay.difficulty = self.difficulty;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
