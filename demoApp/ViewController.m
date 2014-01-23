//
//  ViewController.m
//  demoApp
//
//  Created by nathan byarley on 1/21/14.
//  Copyright (c) 2014 nathan byarley. All rights reserved.
//

#import "ViewController.h"
#import "AddEventViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)passEvent:(NSString *)savedEvent
{
    // Appends  a new event if the eventList already contains an event
    if (eventListing != nil)
    {
        eventListing = [eventListing stringByAppendingString:savedEvent];
    }
    // First event added to the list
    else
    {
        eventListing = [NSString stringWithFormat:@"%@",savedEvent];
    }
    events.text = eventListing;
}



- (void)viewDidLoad
{
    
    //adding default txt.. this can be done two ways one by code(this way) or another by way of UI by way of placeholder.
    events.text = @"No events .. ";
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//using segue allows me to use my delegate
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //making use of the identifier 
    if ([segue.identifier isEqualToString:@"Add Event"])
	{
        AddEventViewController *addEventView = segue.destinationViewController;
        addEventView.myDelegate = self;
	}
}

@end
