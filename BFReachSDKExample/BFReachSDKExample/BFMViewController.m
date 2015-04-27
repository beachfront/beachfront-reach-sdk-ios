//
//  BFMViewController.m
//  BFReachSDKExample
//
//  Created by Todd Kuehnl on 6/13/14.
//  Copyright (c) 2014 Beachfront Media, LLC. All rights reserved.
//

#import "BFMViewController.h"
#import <BFReachSDK/BFReachSDK.h>

@interface BFMViewController () <UITextViewDelegate> {
    UITextView* _textView, *_textView2;
}

@end

@implementation BFMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setHidden:YES];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 75, [[UIScreen mainScreen] bounds].size.width - 40, 40)];
    _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _textView.textAlignment = NSTextAlignmentCenter;
    _textView.font = [UIFont systemFontOfSize:14];
    _textView.delegate = self;
    [_textView setText:@"11a7f5f1-e440-4023-e942-ed394141c212"];
    [self.view addSubview:_textView];
    
    _textView2 = [[UITextView alloc] initWithFrame:CGRectMake(20, [[UIScreen mainScreen] bounds].size.height/2 - 25, [[UIScreen mainScreen] bounds].size.width - 40, 40)];
    _textView2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _textView2.textAlignment = NSTextAlignmentCenter;
    _textView2.font = [UIFont systemFontOfSize:14];
    _textView2.delegate = self;
    [_textView2 setText:@"58598bec-2060-46d7-87aa-d06918cbc6b8"];
    [self.view addSubview:_textView2];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)coolVideoAction:(UIButton *)sender
{
     [[BFReachSDK sharedManager] startWithPlayerId:_textView.text success:^(UIViewController *controller) {
         [self.navigationController pushViewController:controller animated:YES];
     } failure:^(NSError *error) {
         NSLog(@"startWithPlayerId error: %@", error);
     }];
}

- (IBAction)coolVideoAction2:(UIButton *)sender
{
    [[BFReachSDK sharedManager] startWithPlayerId:_textView2.text success:^(UIViewController *controller) {
        [self.navigationController pushViewController:controller animated:YES];
    } failure:^(NSError *error) {
        NSLog(@"startWithPlayerId error: %@", error);
    }];
}

@end
