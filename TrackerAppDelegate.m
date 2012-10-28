//
//  TrackerAppDelegate.m
//  Tracker
//
//  Created by Cesar Rivas on 9/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
// https://developer.apple.com/cocoa/cocoabindings.html

#import "TrackerAppDelegate.h"

@implementation TrackerAppDelegate

@synthesize window;

@synthesize massSlider;
@synthesize weightsSlider;
@synthesize walkingSlider;
@synthesize runningSlider;

@synthesize datePicker;

@synthesize tabView;

@synthesize pathControl;

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
	NSURL *url =  [NSURL URLWithString:@"file://Volumes/FEDORA/personal/personal.db"];
	[pathControl setURL:url];

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
