//
//  ViewController.m
//  LDYSelectivityAlertView
//
//  Created by 李东阳 on 2018/8/15.
//

#define kScreen_Width   [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height  [[UIScreen mainScreen] bounds].size.height
#import "ViewController.h"
#import "LDYSelectivityAlertView.h"

@interface ViewController ()<LDYSelectivityAlertViewDelegate>

@property (nonatomic,strong) UILabel *lable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((kScreen_Width-100)/2, (kScreen_Height-40)/2-40, 100, 40);
    button.layer.cornerRadius = 10;
    [button setTitle:@"点我试试" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.lable = [[UILabel alloc]initWithFrame:CGRectMake(20,(kScreen_Height-40)/2+40, kScreen_Width-40, 40)];
    self.lable.backgroundColor = [UIColor greenColor];
    self.lable.textAlignment = NSTextAlignmentCenter;
    self.lable.layer.masksToBounds = YES;
    self.lable.layer.cornerRadius = 10;
    [self.view addSubview:self.lable];
    
}

-(void)test{
    NSArray *datas = [NSArray arrayWithObjects:@"English",@"Arabic", @"123",@"456",nil];
    LDYSelectivityAlertView *ldySAV = [[LDYSelectivityAlertView alloc]initWithTitle:@"选择语言" datas:datas ifSupportMultiple:NO isIndexFirst:[NSIndexPath indexPathForRow:1 inSection:0] btns:YES];
    ldySAV.delegate = self;
    [ldySAV show];

}

-(void)singleChoiceBlockData:(NSString *)data{
    self.lable.text = data;
}

-(void)multipleChoiceBlockDatas:(NSArray *)datas{
    self.lable.text = [datas componentsJoinedByString:@","];
}

@end
