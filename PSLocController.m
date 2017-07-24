//
//  PSLocController.m
//  Food
//
//  Created by sunny&pei on 2017/7/22.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSLocController.h"
#import "PSMyHomeController.h"
@interface PSLocController ()<UIPickerViewDelegate,UIPickerViewDataSource>
- (IBAction)confirmBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showLab;
@property (weak, nonatomic) IBOutlet UIPickerView *pikerView;
@property (nonatomic,copy) NSString  *cityName;
@property (nonatomic,strong) NSArray  *items; /**< 数据源*/
@property (nonatomic,strong) NSArray  *cityArray; /**< 当前展示省份的城市数组*/
@end

@implementation PSLocController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 数据源方法
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.items.count;
    }else{
        return self.cityArray.count;
    }
}

#pragma mark 代理方法
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        NSDictionary *province = self.items[row];
        return province[@"State"];
    }else{
        return self.cityArray[row][@"city"];
    }
    return nil;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        self.cityArray = self.items[row][@"Cities"];
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        NSLog(@"省份===%@,城市===%@",self.items[row][@"State"],self.cityArray[[pickerView selectedRowInComponent:1]][@"city"]);
        NSString *prv =self.items[row][@"State"];
        NSString *cit =self.cityArray[[pickerView selectedRowInComponent:1]][@"city"];
        NSString *txt = [NSString stringWithFormat:@"%@%@",prv,cit];
        self.cityName = cit;
        self.showLab.text = txt;
    }else
    {
        
        NSLog(@"省份===%@,城市===%@",self.items[[pickerView selectedRowInComponent:0]][@"State"],self.cityArray[row][@"city"]);
        NSString *prv =self.items[[pickerView selectedRowInComponent:0]][@"State"];
        NSString *cit =self.cityArray[row][@"city"];
        NSString *txt = [NSString stringWithFormat:@"%@%@",prv,cit];
        self.cityName = cit;
        self.showLab.text = txt;
    }

}
#pragma mark - 懒加载
-(NSArray *)items{
    if (_items==nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ProvincesAndCities.plist" ofType:nil];
        _items = [NSArray arrayWithContentsOfFile:path];
    }
    return _items;
}
-(NSArray *)cityArray{
    if (!_cityArray) {
        _cityArray = self.items[0][@"Cities"];
    }
    return _cityArray;
}
- (IBAction)confirmBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if (self.block) {
        self.block(self.cityName);
    }
    
    
}
@end
