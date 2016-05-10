//
//  AddCameraViewController.m
//  SoDemonApple
//
//  Created by sandy on 16/5/10.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "AddCameraViewController.h"
#import "IPCam.h"
#import "IPCamMgr.h"
#import "Storage.h"

@interface AddCameraViewController (){
    
    __weak IBOutlet UITextField *cameraID;

    __weak IBOutlet UITextField *cameraAlias;
    
    __weak IBOutlet UITextField *cameraPassword;

}

@end

@implementation AddCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"Add Camera";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonSaveAction:(id)sender {
    [[Storage get_share]add_camera:cameraID.text alias:cameraAlias.text user:@"admin" pwd:cameraPassword.text https:NO sosocam_id:nil model:0 master:NO];
    
    [[IPCamMgr get_share] add_camera:cameraID.text alias:cameraAlias.text user:@"admin" pwd:cameraPassword.text https:NO];
        
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
