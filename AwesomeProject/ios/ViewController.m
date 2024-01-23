//
//  ViewController.m
//  AwesomeProject
//
//  Created by yuxin on 2024/1/17.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  UIButton  *senderButton = [UIButton  buttonWithType:UIButtonTypeCustom];
  [senderButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
  senderButton.frame =CGRectMake(0, 100, 200, 200);
  senderButton.backgroundColor = [UIColor redColor];
  [self.view addSubview:senderButton];
    // Do any additional setup after loading the view.
}

- (void)push {
  SecondViewController  *vc = [[SecondViewController alloc] init];
  
  [self.navigationController pushViewController:vc animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
