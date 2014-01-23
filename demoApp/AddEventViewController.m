//
//  AddEventViewController.m
//  demoApp
//
//  Created by nathan byarley on 1/21/14.
//  Copyright (c) 2014 nathan byarley. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()

@end

@implementation AddEventViewController

@synthesize myDelegate;

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
    //Set minimun date for datePicker
    eventDateTime.minimumDate = [NSDate date];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClickSave:(UIButton *)sender {
    
    if (sender != nil)
    {
        // tag 1 is the save button
        if (sender.tag == 1)
        {
            //notifies the user that the text field can not be empty
            if (eventName.text.length == 0)
            {
                UIAlertView *eventAlert = [[UIAlertView alloc]initWithTitle:@"Event Error" message:@"Please add an event description." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [eventAlert show];
            }
            // notifies the user a date must be selected
            else if (dateTimeString == NULL)
            {
                UIAlertView *dateAlert = [[UIAlertView alloc]initWithTitle:@"Date Error" message:@"Please select and date and time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [dateAlert show];
            }
            else
            {
                if (myDelegate != nil)
                {
                    // String that contains data to be sent to ViewController
                    savedEventString = [NSString stringWithFormat:@"%@ \n %@ \n \n",eventName.text, dateTimeString];
                    
                    [myDelegate passEvent:savedEventString];
                    
                    // Dismisses the modal view
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }
        }
    }
}

-(IBAction)onClickCloseKeyboard:(id)sender {
    //closes the keyboard
    [eventName resignFirstResponder];
}

-(IBAction)onClickCancel:(id)sender {
        // Dismisses the add event view
        [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onChangeDate:(UIDatePicker *)sender {
    if (sender != nil)
    {
        NSDate *dateSelected = sender.date;
        if (dateSelected != nil)
        {
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
            if (dateFormat != nil)
            {
                [dateFormat setDateFormat:@"EEE, MMM d, yyyy hh:mm a"];
                dateTimeString = [dateFormat stringFromDate:dateSelected];
            }
        }
    }
}

@end
