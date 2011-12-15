//
//  SwitchViewController.m
//  View Switcher
//
//  Created by Saurabh Jain on 12/11/11.
//  Copyright 2011 USC Student. All rights reserved.
//

#import "SwitchViewController.h"
#import "BlueViewController.h"
#import "YellowViewController.h"


@implementation SwitchViewController
@synthesize blueViewController;
@synthesize yellowViewController;

- (IBAction)swicthViews:(id)sender 
{
 // Lazy load - load yellow nib first time the button is pressed.
    if (self.yellowViewController == nil) {
        
        YellowViewController *yellowController = [[YellowViewController alloc] initWithNibName:@"YellowViewController" bundle:nil];
        self.yellowViewController = yellowController;
        [yellowController release];
        
    }
    
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    UIViewController *coming = nil;
    UIViewController *going = nil;
    UIViewAnimationTransition transition;
    
    if(self.blueViewController.view.superview == nil) {
        
        coming = blueViewController;
        going = yellowViewController;
        transition = UIViewAnimationTransitionFlipFromLeft;
   
    }
    else {
        
        coming = yellowViewController;
        going = blueViewController;
        transition = UIViewAnimationTransitionFlipFromRight;
        
    }
    
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [coming viewWillAppear:YES];
    [going viewWillDisappear:YES];
    [going.view removeFromSuperview];
    [self.view insertSubview: coming.view atIndex:0];
    [going viewDidDisappear:YES];
    [coming viewDidAppear:YES];
    
    [UIView commitAnimations];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [yellowViewController release];
    [blueViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    BlueViewController *blueController = [[BlueViewController alloc] initWithNibName:@"BlueViewController" bundle:nil];
    self.blueViewController = blueController;
    [self.view insertSubview:blueController.view atIndex:0];
    [blueController release];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
