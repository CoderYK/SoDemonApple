//
//  CameraListTableViewCell.m
//  SoDemonApple
//
//  Created by feng on 16/5/10.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "CameraListTableViewCell.h"

@implementation CameraListTableViewCell{
    
    __weak IBOutlet UILabel *labelCamAlias;
    
    __weak IBOutlet UILabel *labelCamStatus;

    __weak IBOutlet UILabel *labelCamID;
}

- (void)awakeFromNib {
    // Initialization code
}

-(void)showCameraInfo:(IPCam*)ipcam{
    
    labelCamAlias.text = [ipcam alias];
    labelCamID.text = [ipcam camera_id];
    if ([ipcam status] == IPCAM_STATUS_CONNECTED ) {
        labelCamStatus.text = @"connect success";
    }

    else if ([ipcam status] == IPCAM_STATUS_IDLE ){
        labelCamStatus.text = @"connect fail";
    }
    else{
        labelCamStatus.text = @"connecting...";
    }
}



@end
