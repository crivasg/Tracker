//
//  TrackerAppDelegate.m
//  Tracker
//
//  Created by Cesar Rivas on 9/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackerAppDelegate.h"

@implementation TrackerAppDelegate

@synthesize window;

@synthesize massSlider;
@synthesize weightsSlider;
@synthesize walkingSlider;
@synthesize runningSlider;

@synthesize datePicker;

@synthesize tabView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification 
{
	
	[self setup];

}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
	return YES;
}

- (IBAction)store: (id)sender
{
	NSLog(@"hola....");
	
	NSLog(@"%@",[ [tabView selectedTabViewItem] label]);
	
	NSLog(@"%@",[ datePicker dateValue]);
}

- (void)setup
{

	NSDate *today = [ NSDate date];
	
	[datePicker setDateValue:today];
	
	[massSlider setFloatValue:123.3];
	[weightsSlider setIntegerValue:50];
	[walkingSlider setIntegerValue:30];
	[runningSlider setIntegerValue:0];
	
	[massSlider performClick:nil];
	[weightsSlider performClick:nil];
	[walkingSlider performClick:nil];
	[runningSlider performClick:nil];

}


@end
