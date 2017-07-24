//
//  PSMyHomeController.m
//  Food
//
//  Created by sunny&pei on 2017/7/16.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSMyHomeController.h"
#import "UISearchBar+PS.h"
#import "PSLocController.h"
#import "PSPubButton.h"
#import "PSrouteViewController.h"
@interface PSMyHomeController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIButton *locBtn;
@property(nonatomic,weak)IBOutlet UISearchBar *customSearchBar;
@property (weak, nonatomic) IBOutlet UIView *btnView;
@property(nonatomic,strong)UIButton *voiceButton;
@end

@implementation PSMyHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setSearchBar];
    
    [self addMainBtn];
    
}
-(void)addMainBtn{
    
    PSPubButton *routeBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(18.8, 10, 80, 85) title:@"吃货路线" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"btn_route"] imageViewContentMode:UIViewContentModeCenter];
    [self.btnView addSubview:routeBtn];
    [routeBtn addTarget:self action:@selector(routeBtnClick) forControlEvents:UIControlEventTouchDown];
    
    PSPubButton *eatBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(18.8*2+80, 10, 80, 85) title:@"美食达人" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"btn_eat"] imageViewContentMode:UIViewContentModeCenter];
    [self.btnView addSubview:eatBtn];
    
    PSPubButton *specialBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(18.8*3+160, 10, 80, 85) title:@"特色店铺" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"btn_special"] imageViewContentMode:UIViewContentModeCenter];
    [self.btnView addSubview:specialBtn];
    
    PSPubButton *recomBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(18.8*4+240, 10, 80, 85) title:@"大咖推荐" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"btn_recom"] imageViewContentMode:UIViewContentModeCenter];
    [self.btnView addSubview:recomBtn];

}
-(void)routeBtnClick{
    PSrouteViewController *vc = [[PSrouteViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:NO];

}
-(void)setSearchBar{
    self.customSearchBar.delegate =self;
    self.customSearchBar.placeholder = @"输入你想要搜索的美食";
    // 设置背景颜色
    //这个操作是为了去掉上下黑线
    self.customSearchBar.backgroundImage = [[UIImage alloc]init];
    //设置SeachBar的颜色
    self.customSearchBar.barTintColor = [UIColor colorWithRed:236.0 green:127.0 blue:104.0 alpha:1.0];
    //2.设置圆角和边框颜色
    UITextField *searchField = [self.customSearchBar valueForKey:@"searchField"];
    if (searchField) {
        [searchField setBackgroundColor:[UIColor colorWithRed:236.0 green:127.0 blue:104.0 alpha:1.0]];
        searchField.layer.cornerRadius = 14.0f;
        searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
    }
    //设置取消按钮
    //    [self.customSearchBar setShowsCancelButton:YES];
    //3.设置按钮文字和颜色
    [self.customSearchBar fm_setCancelButtonTitle:@"取消"];
    self.customSearchBar.tintColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1];
    //设置取消按钮字体
    [self.customSearchBar fm_setCancelButtonFont:[UIFont systemFontOfSize:20]];
    //修正光标颜色
    [searchField setTintColor:[UIColor blackColor]];
    
    //4. 设置输入框文字颜色和字体
    [self.customSearchBar fm_setTextColor:[UIColor blackColor]];
    [self.customSearchBar fm_setTextFont:[UIFont systemFontOfSize:14]];
    
    //5. 设置搜索Icon
    [self.customSearchBar setImage:[UIImage imageNamed:@"Search_Icon"]
                  forSearchBarIcon:UISearchBarIconSearch
                             state:UIControlStateNormal];

}
#pragma mark -
#pragma mark .....:::::: UISearchBarDelegate ::::::.....


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = @"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar endEditing:YES];
}

//监控文本变化
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    self.voiceButton.hidden = searchBar.text.length + (text.length - range.length) > 0;
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[PSLocController class]]) {
        PSLocController *vc = (PSLocController *)segue.destinationViewController;
        vc.block = ^(NSString *str){
            [self.locBtn setTitle:str forState:UIControlStateNormal];
        };
    }
}

@end
