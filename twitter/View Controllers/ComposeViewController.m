//
//  ComposeViewController.m
//  twitter
//
//  Created by Mercy Bickell on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *composeTweetTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeComposeButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *finishTweetButton;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)dismissComposeView:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)finishAndSendTweet:(id)sender {
    [[APIManager shared] postStatusWithText:self.composeTweetTextView.text completion:^(Tweet *tweet, NSError *error) {
        if(tweet) {
            NSLog(@"Successfully tweeted");
            [self dismissViewControllerAnimated:true completion:nil];
        }
        else {
             NSLog(@"Error posting tweet: %@", error.localizedDescription);
        }
    }];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
