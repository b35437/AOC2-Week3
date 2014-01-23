//
//  ViewController.h
//  demoApp
//
//  Created by nathan byarley on 1/21/14.
//  Copyright (c) 2014 nathan byarley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEventViewController.h"

@interface ViewController : UIViewController<AddEventDelegate> {
    
    //View outlets
    IBOutlet UITextView *events;
    
    NSString *eventListing;
    
}

@end
