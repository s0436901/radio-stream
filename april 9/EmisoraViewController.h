//
//  EmisoraViewController.h
//  april 9
//
//  Created by webstudent on 4/9/14.
//  Copyright (c) 2014 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface EmisoraViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource,AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *radiostations;
@property (strong, nonatomic) NSArray *dial;
@property (strong, nonatomic) IBOutlet UIWebView *webview;
- (IBAction)btnStop:(id)sender;
- (IBAction)btnPlay:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnPlay;


@property (strong, nonatomic) IBOutlet UIButton *btnStop;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


//self.avAsset = [AVURLAsset URLAssetWithURL:url options:nil];
@property (strong, nonatomic) AVURLAsset *avAsset;
//self.playerItem = [AVPlayerItem playerItemWithAsset:avAsset];
@property (strong, nonatomic) AVPlayerItem *playerItem;

@end
