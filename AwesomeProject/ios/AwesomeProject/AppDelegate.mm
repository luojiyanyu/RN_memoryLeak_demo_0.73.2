#import "AppDelegate.h"
#import "ViewController.h"
//#import <React/RCTBundleURLProvider.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
//  self.initialProps = @{};
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

  ViewController  * vc = [[ViewController alloc] init];
  UINavigationController  *nav =  [[UINavigationController alloc] initWithRootViewController:vc];
  self.window.rootViewController = nav;
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;

//  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

//- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
//{
//  return [self getBundleURL];
//}
//
//- (NSURL *)getBundleURL
//{
//#if DEBUG
//  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
//#else
//  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
//#endif
//}

@end
