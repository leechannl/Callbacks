//
//  Logger.h
//  Callbacks
//
//  Created by mm on 6/1/14.
//  Copyright (c) 2014 mm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject

{
    NSMutableData *incomingData;
}

- (void)sayOuch:(NSTimer *)t;

@end
