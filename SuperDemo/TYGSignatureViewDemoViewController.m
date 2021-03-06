//
//  TYGSignatureViewDemoViewController.m
//  SuperDemo
//
//  Created by 谈宇刚 on 15/11/26.
//  Copyright © 2015年 TYG. All rights reserved.
//

#import "TYGSignatureViewDemoViewController.h"
#import "TYGSignatureView.h"
#import "TYGSignatureViewQuartz.h"
#import "TYGSignatureViewQuartzQuadratic.h"

#import "TYG_allHeadFiles.h"

@interface TYGSignatureViewDemoViewController (){
    
    TYGSignatureViewQuartz *view1;
    TYGSignatureViewQuartzQuadratic *view2;
    TYGSignatureView *view3;
    
}

@end

@implementation TYGSignatureViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.38f animations:^{
        if (nil == view1) {
            view1 = [[TYGSignatureViewQuartz alloc] init];
            view1.frame = self.signatureView.bounds;
            view1.backgroundColor = [Utility RandomColor];
        }
        [self.signatureView addSubview:view1];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)seg:(UISegmentedControl *)sender {
    
    SAFE_emptyView(self.signatureView);
    
    switch (sender.selectedSegmentIndex) {
        case 0:{
            //连点成线
            if (nil == view1) {
                view1 = [[TYGSignatureViewQuartz alloc] init];
                view1.frame = self.signatureView.bounds;
                view1.backgroundColor = [Utility RandomColor];
            }
            
            [self.signatureView addSubview:view1];
            break;
        }
        case 1:{
            //二次贝塞尔曲线
            if (nil == view2) {
                view2 = [[TYGSignatureViewQuartzQuadratic alloc] init];
                view2.frame = self.signatureView.bounds;
                view2.backgroundColor = [Utility RandomColor];
            }
            
            [self.signatureView addSubview:view2];
            break;
        }
        case 2:{
            //可变的笔刷宽度
            if (nil == view3) {
                view3 = [[TYGSignatureView alloc] init];
                view3.frame = self.signatureView.bounds;
                view3.backgroundColor = [Utility RandomColor];
                
                view3.strokeColor = [UIColor redColor];
            }
            
            [self.signatureView addSubview:view3];
            break;
        }
        default:
            break;
    }
}
@end
