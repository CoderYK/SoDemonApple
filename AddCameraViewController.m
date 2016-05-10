//
//  AddCameraViewController.m
//  SoDemonApple
//
//  Created by sandy on 16/5/10.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "AddCameraViewController.h"

@interface AddCameraViewController (){
    
    __weak IBOutlet UITextField *cameraID;

    __weak IBOutlet UITextField *cameraAlias;
    
    __weak IBOutlet UITextField *cameraPassword;

}

@end

@implementation AddCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonSaveAction:(id)sender {
}


@end
