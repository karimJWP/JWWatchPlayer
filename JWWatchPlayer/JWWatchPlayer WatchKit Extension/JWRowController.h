//
//  JWRowController.h
//  JWWatchPlayer
//
//  Created by Karim Mourra on 3/22/16.
//  Copyright © 2016 Karim Mourra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface JWRowController : NSObject

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *image;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *picture;

@end
