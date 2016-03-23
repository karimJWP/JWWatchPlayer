//
//  InterfaceController.m
//  JWWatchPlayer WatchKit Extension
//
//  Created by Karim Mourra on 3/22/16.
//  Copyright © 2016 Karim Mourra. All rights reserved.
//

#import "InterfaceController.h"
#import "JWRowController.h"


@interface InterfaceController()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *movieChoices;
@property (nonatomic) NSArray *movieURLs;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self setUpMovies];
    [self setUpRows];
}

- (void)setUpMovies
{
    NSURL *movieURL = [[NSBundle mainBundle] URLForResource:@"local" withExtension:@"mov"];
    NSURL *sintelURL = [[NSBundle mainBundle] URLForResource:@"sintel" withExtension:@"mp4"];
    NSURL *externalURL = [NSURL URLWithString:@"https://content.bitsontherun.com/videos/bkaovAYt-52qL9xLP.mp4"];
    self.movieURLs = @[movieURL, sintelURL, externalURL];
}

- (void)setUpRows
{
    [self.movieChoices setNumberOfRows:self.movieURLs.count withRowType:@"JWRow"];
    for (NSInteger k=0; k < self.movieURLs.count; k++) {
        JWRowController *rowController = [self.movieChoices rowControllerAtIndex:k];
        NSURL* movieURL = self.movieURLs[k];
        [rowController.label setText:movieURL.absoluteString.lastPathComponent.stringByDeletingPathExtension];
        [rowController.image setBackgroundImageNamed:@"movie_poster"];
        [rowController.picture setImageNamed:@"jwpic"];
    }
}

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    if ([table isEqual:self.movieChoices]) {
        [self presentMediaPlayerControllerWithURL:self.movieURLs[rowIndex] options:nil completion:^(BOOL didPlayToEnd, NSTimeInterval endTime, NSError * _Nullable error) {}];
    }
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



