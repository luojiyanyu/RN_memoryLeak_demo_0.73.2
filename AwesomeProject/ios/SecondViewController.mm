//
//  SecondViewController.m
//  AwesomeProject
//
//  Created by yuxin on 2024/1/17.
//

#import "SecondViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTRootView.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <react/renderer/runtimescheduler/RuntimeScheduler.h>
#import "RCTAppSetupUtils.h"
#import "RCTLegacyInteropComponents.h"

@class RCTBridge;
@protocol RCTBridgeDelegate;
@protocol RCTComponentViewProtocol;
@class RCTSurfacePresenterBridgeAdapter;
@interface SecondViewController ()<RCTCxxBridgeDelegate> {
  std::shared_ptr<facebook::react::RuntimeScheduler> _runtimeScheduler;
}
@property (nonatomic, strong) NSString *moduleName;
@property (nonatomic, strong) NSDictionary *initialProps;
@property (nonatomic, strong) RCTBridge *bridge;

@end

@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
  self.view.backgroundColor = [UIColor greenColor];
  self.moduleName = @"AwesomeProject";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};
  if (!self.bridge) {
    self.bridge = [self createBridgeWithDelegate:self launchOptions:nil];
  }
  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = [self createRootViewWithBridge:self.bridge moduleName:self.moduleName initProps:initProps];
  rootView.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
  [self.view addSubview:rootView];

}
- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self getBundleURL];
}

- (NSURL *)getBundleURL
{
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
}

- (void)dealloc {
  NSLog(@"释放了");
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = self.initialProps ? [self.initialProps mutableCopy] : [NSMutableDictionary new];


  return initProps;
}

- (RCTBridge *)createBridgeWithDelegate:(id<RCTBridgeDelegate>)delegate launchOptions:(NSDictionary *)launchOptions
{
  return [[RCTBridge alloc] initWithDelegate:delegate launchOptions:launchOptions];
}

- (UIView *)createRootViewWithBridge:(RCTBridge *)bridge
                          moduleName:(NSString *)moduleName
                           initProps:(NSDictionary *)initProps
{
  BOOL enableFabric = NO;

  UIView *rootView = RCTAppSetupDefaultRootView(bridge, moduleName, initProps, enableFabric);

  rootView.backgroundColor = [UIColor systemBackgroundColor];

  return rootView;
}



- (BOOL)runtimeSchedulerEnabled
{
  return YES;
}



#pragma mark - RCTCxxBridgeDelegate
- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _runtimeScheduler = std::make_shared<facebook::react::RuntimeScheduler>(RCTRuntimeExecutorFromBridge(bridge));

  return RCTAppSetupJsExecutorFactoryForOldArch(bridge, _runtimeScheduler);
}


@end
