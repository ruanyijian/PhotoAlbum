//
//  ViewController.m
//  PhotoAlbumDemo
//
//  Created by 沈凯 on 2018/9/6.
//  Copyright © 2018年 Ssky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) UIImagePickerController *picker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.picker.delegate = self;
    self.picker.allowsEditing = YES;
}

- (IBAction)buttonAction:(UIButton *)sender {
    
    BOOL isPicker = NO;
    
    switch (sender.tag) {
        case 10000:
//            打开相机
            isPicker = true;
//            判断相机是否可用
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                isPicker = true;
            }
            break;
            
        case 10001:
//            打开相册
            self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            isPicker = true;
            break;
            
        default:
            self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            isPicker = true;
            break;
    }
    
    if (isPicker) {
        [self presentViewController:self.picker animated:YES completion:nil];
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:@"相机不可用" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (UIImagePickerController *)picker
{
    if (!_picker) {
        _picker = [[UIImagePickerController alloc]init];
    }
    return _picker;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
//    获取图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.image.image = image;
//    获取图片后返回
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//按取消按钮时候的功能
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
//    返回
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
