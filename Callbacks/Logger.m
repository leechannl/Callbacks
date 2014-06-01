//
//  Logger.m
//  Callbacks
//
//  Created by mm on 6/1/14.
//  Copyright (c) 2014 mm. All rights reserved.
//

#import "Logger.h"

@implementation Logger

- (void)sayOuch:(NSTimer *)t
{
    NSLog(@"Ouch!");
}

// Call each time a chunk of data arrives
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"received %lu bytes", [data length]);

    // Create a mutalble data  if it doesn't already exist
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
}

// Called when the last chunk has been processed
- (void)connectionDidFinishedLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:incomingData
                                             encoding:NSUTF8StringEncoding];
    incomingData = nil;
    NSLog(@"string has %lu characters", [string length]);

}

// Called if the fetct fails
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connetion failed: %@", [error localizedDescription]);
    incomingData = nil;
}

- (void)zoneChange:(NSNotification *)note
{
    NSLog(@"the system time zone has changed");
}

@end
