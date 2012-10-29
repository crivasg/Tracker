//
//  TrackerAppDelegate.m
//  Tracker
//
//  Created by Cesar Rivas on 9/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
// https://developer.apple.com/cocoa/cocoabindings.html
// http://developer.apple.com/library/mac/#samplecode/ObjectPath/Listings/MyWindowController_m.html

#import "TrackerAppDelegate.h"
#import "NSFileManager+DirectoryLocations.h"

@implementation TrackerAppDelegate

@synthesize window;
@synthesize prefWindow;

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
	
	[pathControl setTarget:self];
    [pathControl setDoubleAction:@selector(pathControlDoubleClick:)];
	[pathControl setAction:@selector(pathControlActionClick:)];
    //[pathControl setDelegate:self];
	
	NSString *pathKey    = @"path";
	NSString *unitsKey    = @"englishUnits";
	NSPathControl *path = (NSPathControl *)[[NSUserDefaults standardUserDefaults] objectForKey:pathKey];
	BOOL englishUnits = [[NSUserDefaults standardUserDefaults] boolForKey:unitsKey];
	
	if (path == nil)  
	{
		NSLog(@"default for path control does not exist");
		//[ pathControl performClick:0];
		NSString *pathDir = [[NSFileManager defaultManager] applicationSupportDirectory];
		NSString *databasePath = [ pathDir stringByAppendingPathComponent:@"database.db"];
		
		NSLog(@"%@",databasePath);
		
		NSURL *url =  [NSURL fileURLWithPath:databasePath 
								 isDirectory:NO];
		
		[pathControl setURL:url];
		
	}

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

- (void)pathControlDoubleClick:(id)sender
{
	
	NSLog(@"path control double click");
	
}

- (void)pathControlActionClick:(id)sender
{
	
	NSOpenPanel *openPanel = [ NSOpenPanel openPanel ];
	NSArray *fileTypes = [NSArray arrayWithObjects:@"db",nil];
	[openPanel setAllowsMultipleSelection: NO];
	[openPanel setCanChooseDirectories:NO];
	[openPanel setCanCreateDirectories:NO];
	[openPanel setCanChooseFiles:YES];
	[openPanel setAllowedFileTypes:fileTypes];
	[openPanel setDirectoryURL:[pathControl URL]];
	
	[openPanel beginSheetModalForWindow:prefWindow completionHandler:^(NSInteger result) {
		
		if (result == NSFileHandlingPanelOKButton) 
		{
			
			// Do something.
		}
	}
	];
	
	
}


@end
