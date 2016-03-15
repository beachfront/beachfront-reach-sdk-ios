//
//  BFReachLiteViewController.m
//  BFReachSDKExample
//
//  Created by Viktor on 15.03.16.
//  Copyright © 2016 Beachfront Media, LLC. All rights reserved.
//

#import "BFReachLiteViewController.h"
#import <BFReachSDK/BFReachSDK.h>

@interface BFReachLiteViewController (){
      BFReachView* _reachView;
}
@property (weak, nonatomic) IBOutlet UITextField *IOAppIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *IOAdUnitIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *playerIDTextField;
@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UITextField *videoIDTextField;

@end

@implementation BFReachLiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachAdStartedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachAdPausedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachAdResumedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachAdEndedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachAdRequestNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachAdClickedNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachContentStartedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachContentPausedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachContentResumedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachContentEndedNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachEnterFullscreenNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:BFReachExitFullscreenNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationObserver:) name:@"analyticURL" object:nil];
}

- (void)notificationObserver:(NSNotification *)notification {
    NSLog(@"%@", notification.name);
    
    NSMutableString* msg = [[NSMutableString alloc] initWithString:[[notification.name componentsSeparatedByString:@"."] lastObject]];
    
    if ([notification.name isEqualToString:@"analyticURL"]){
        msg = [[NSMutableString alloc] initWithString:notification.userInfo[@"analyticURL"]];
    }
    
    if ([[msg substringToIndex:2] isEqualToString:@"ad"])
        [msg insertString:@" " atIndex:2];
    if ([[msg substringToIndex:7] isEqualToString:@"content"])
        [msg insertString:@" " atIndex:7];
    
    if ([notification.name isEqualToString:@"analyticURL"]){
        
        [msg appendString:@"\n"];
        [msg appendString:@"\n"];
        
    }
    else
    {
        [msg appendString:@"\n"];
        [msg insertString:@"event: " atIndex:0];
    }
    
    NSMutableAttributedString* allString = [[NSMutableAttributedString alloc] initWithAttributedString:_logTextView.attributedText];
    
    if ([notification.name isEqualToString:@"analyticURL"])
        [allString appendAttributedString:[[NSAttributedString alloc] initWithString:msg attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}]];
    else
        [allString appendAttributedString:[[NSAttributedString alloc] initWithString:msg attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}]];
    
    _logTextView.attributedText = allString;
    
    
    NSRange range = NSMakeRange(_logTextView.text.length - 1, 1);
    
    [_logTextView scrollRangeToVisible:range];
    
    _logTextView.scrollEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pauseReach:(UIButton *)sender {
        [_reachView pause];
}

- (IBAction)resumeReach:(UIButton *)sender {
     [_reachView resume];
}

- (IBAction)dismissReach:(UIButton *)sender {
    [_reachView dismiss];
    _reachView = nil;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)addReachPlayer:(UIButton *)sender {
    [BFReachSDK getReachViewInView:self.view inRect:CGRectMake(5, 310, 310, 180) AppID:_IOAppIDTextField.text adUnitID:_IOAdUnitIDTextField.text videoID:_videoIDTextField.text playerID:_playerIDTextField.text success:^(BFReachView *reachView) {
        
        _reachView = reachView;
        _reachView.autoresizingMask = ( UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
        [self.view addSubview:_reachView];
        [_reachView resume];
        
    } failure:^(NSError *error) {
        
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
