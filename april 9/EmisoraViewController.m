//
//  EmisoraViewController.m
//  april 9
//
//  Created by webstudent on 4/9/14.
//  Copyright (c) 2014 RVC Student. All rights reserved.
//

#import "EmisoraViewController.h"

@interface EmisoraViewController ()
{
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;
}
@end
int radiorow;
NSURL *url;
@implementation EmisoraViewController
@synthesize webview;

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //[_dial[row] floatValue];
    // [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: _dial[row]]]];
    radiorow=row;
    url = [NSURL URLWithString:_dial[row]];
    
    
    self.avAsset = [AVURLAsset URLAssetWithURL:url options:nil];
    self.playerItem = [AVPlayerItem playerItemWithAsset:self.avAsset];
    self.audioPlayer = [AVPlayer playerWithPlayerItem:self.playerItem];
    [self.audioPlayer play];

}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 37)];
    
    if (component == 0) {
        
        label.font=[UIFont boldSystemFontOfSize:20];
        label.textAlignment = UITextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        
        label.text = [NSString stringWithFormat:@"%@", [ _radiostations objectAtIndex:row]];
        label.font=[UIFont boldSystemFontOfSize:20];
        
    }
    
    return label;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _radiostations.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _radiostations[row];
}

- (void)viewDidLoad

{
 
    // Disable Stop/Play button when application launches
    [self.btnStop setEnabled:YES];
    [self.btnPlay setEnabled:YES];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    _radiostations = @[@"88.3 WFEN",  @"89.5 WNIJ", @"90.5 WNIU", @" 91.1 WGSL", @"93.3 WHJG", @"94.5 WJCH", @"95.3 WRTB", @"96.7 WKGL", @"97.5 WZOK", @"98.5 WXXQ", @"99.3 WTPB", @"100.5 W263BJ", @"100.9 WQFL", @"103.1 WGFB", @"104.9 WXRX", @"105.7 W289AB", @"106.3 WYRB", @"107.3 WSJY"];
    
    
    _dial = @[@"http://wfen.streamon.fm/listen.m3u",
              @"http://peace.str3am.com:6810/live-96k.mp3.m3u",
              @"http://peace.str3am.com:6840/live-128k.mp3.m3u",
              @"http://emf.mp3.miisolutions.net/kloveicecast/klove_web_tunein.m3u",
              @"http://whjg.streamon.fm/listen.m3u",
              @"http://asx.abacast.com/family-east-128.m3u",
              @"http://out1.cmn.icy.abacast.com/wrtb-wrtbfmaac-64.m3u",
              @"http://provisioning.streamtheworld.com/pls/wkglfma...",
              @"http://provisioning.streamtheworld.com/pls/wzokfma...",
              @"http://provisioning.streamtheworld.com/pls/wxxqfma...",
              @"http://out1.cmn.icy.abacast.com/wrtb-wrtbfmaac-64.m3u",
              @"http://out1.cmn.icy.abacast.com/wrtb-wrtbfmaac-64.m3u"];
    
    // Set the audio file
 
    
    url = [NSURL URLWithString:@"http://peace.str3am.com:6810/live-96k.mp3"];
    
  
    self.avAsset = [AVURLAsset URLAssetWithURL:url options:nil];
    self.playerItem = [AVPlayerItem playerItemWithAsset:self.avAsset];
    self.audioPlayer = [AVPlayer playerWithPlayerItem:self.playerItem];
    [self.audioPlayer play];
   // NSLog(@"error %@", error);
    //Load RVC WWW
   // NSURL *url = [NSURL URLWithString:@"http://peace.str3am.com:6810/live-96k.mp3"];
   // NSURLRequest *req = [NSURLRequest requestWithURL:url];
   // [self.webview loadRequest:req];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    webview.hidden=TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

- (IBAction)btnStop:(id)sender {
   
    [self.audioPlayer pause];

}

- (IBAction)btnPlay:(id)sender {
  
    [self.audioPlayer play];

}
@end
