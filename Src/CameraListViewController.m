//
//  CameraListViewController.m
//  SoDemonApple
//
//  Created by feng on 16/5/10.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "CameraListViewController.h"
#import "CameraListTableViewCell.h"
#import "AddCameraViewController.h"

@interface CameraListViewController (){
    NSArray *ipcamList;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tabelViewCameraList;

@end

@implementation CameraListViewController

-(void)addDelegateToEveryIpcam{
    for (int i = 0; i< ipcamList.count; i++) {
        IPCam * cam = [ipcamList objectAtIndex:i];
        [cam add_delegate:self];
    }
}
-(void)removeDelegateToEveryIpcam{
    for (int i = 0; i< ipcamList.count; i++) {
        IPCam * cam = [ipcamList objectAtIndex:i];
        [cam remove_delegate:self];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ipcamList = [[IPCamMgr get_share]get_cameras_list];
    self.navigationController.title = @"Camera List";
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self addDelegateToEveryIpcam];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeDelegateToEveryIpcam];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonAddAction:(id)sender {
    AddCameraViewController* addVC = [[AddCameraViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
}

#pragma mark UITableViewDataSource&UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ipcamList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID =@"CameraListTableViewCell";
    CameraListTableViewCell * cell = (CameraListTableViewCell*)[self.tabelViewCameraList dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"CameraListTableViewCell" owner:self options:nil];
            cell = [array objectAtIndex:0];
        }
    [cell showCameraInfo:[ipcamList objectAtIndex:indexPath.row]];
        return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82;
}
- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
