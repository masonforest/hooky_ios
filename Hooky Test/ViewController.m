//
//  ViewController.m
//  Hooky Test
//
//  Created by Mason Fischer on 2/17/13.
//  Copyright (c) 2013 Mason Fischer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://hooky-io.herokuapp.com/subscribe/123"]];
    
    [request setValue: @"text/event-stream" forHTTPHeaderField:@"Accept"];

    NSURLConnection *connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    self.textArea.text = [self.textArea.text stringByAppendingString: @"\n"];
    self.textArea.text = [self.textArea.text stringByAppendingString: @"Webhook Received!"];
    self.textArea.text = [self.textArea.text stringByAppendingString: @"\n"];
    self.textArea.text = [self.textArea.text stringByAppendingString: string];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
