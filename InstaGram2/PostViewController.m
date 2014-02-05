//
//  PostViewController.m
//  InstaGram2
//
//  Created by Jared Friedman on 2/4/14.
//  Copyright (c) 2014 Jared Friedman. All rights reserved.
//

#import "PostViewController.h"
#import "Parse/Parse.h"
#import "ViewController.h"

@interface PostViewController () <UIImagePickerControllerDelegate, UINavigationBarDelegate, UINavigationControllerDelegate>
{
    
    __weak IBOutlet UIImageView *myImageView;
}

@end

@implementation PostViewController

- (IBAction)onAddPicturePressed:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    myImageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
