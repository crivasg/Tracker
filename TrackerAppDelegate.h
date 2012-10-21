//
//  TrackerAppDelegate.h
//  Tracker
//
//  Created by Cesar Rivas on 9/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TrackerAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSSlider *massSlider;
	NSSlider *weightsSlider;
	NSSlider *walkingSlider;
	NSSlider *runningSlider;
	
	NSDatePicker *datePicker;
	
	NSTabView *tabView;
	
}

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSSlider *massSlider;
@property (assign) IBOutlet NSSlider *weightsSlider;
@property (assign) IBOutlet NSSlider *walkingSlider;
@property (assign) IBOutlet NSSlider *runningSlider;

@property (assign) IBOutlet NSDatePicker *datePicker;

@property (assign) IBOutlet NSTabView *tabView;

- (IBAction)store: (id)sender;

- (void)setup;

@end
