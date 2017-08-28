//
//  ViewController.m
//  HTTPTransfer
//
//  Created by 柏超曾 on 2017/8/28.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

#import "ViewController.h"
#import "HTTPServer.h"
#import "MyHTTPConnection.h"
#import "ZBTool.h"
@interface ViewController (){
    HTTPServer * httpServer;
}

@property (weak, nonatomic) IBOutlet UILabel *IP;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.\
    
    
    httpServer = [[HTTPServer alloc] init];
    
    [httpServer setType:@"_http._tcp."];
    
    // webPath是server搜寻HTML等文件的路径
    
    NSString *webPath = [[NSBundle mainBundle] resourcePath];
    
    [httpServer setDocumentRoot:webPath];
    
    [httpServer setConnectionClass:[MyHTTPConnection class]];
    
    
    
    NSError *err;
    
    if ([httpServer start:&err]) {
        
        

        
        self.IP.text  = [NSString stringWithFormat:@"%@:%hu",[ZBTool getIPAddress:YES],[httpServer listeningPort]];
        
    }else{
        
        NSLog(@"%@",err);
        
        
        
    }
    
//    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:@"obj1",@"key1",@"obj2",@"key2", @"obj3",@"key3",nil];
//    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
//        NSLog(@"value for key %@ is %@ ", key, value);
//        if ([@"key3" isEqualToString:key]) {
//            *stop = YES;
//        }
//    }];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
