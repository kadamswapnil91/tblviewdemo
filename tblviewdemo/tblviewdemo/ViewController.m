//
//  ViewController.m
//  tblviewdemo
//
//  Created by mac on 2/11/20.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ViewController.h"
#import "cutTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tblview;
@property (strong, nonatomic)NSArray *tblarray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tblarray = [[NSArray alloc]init];
    
    
    [self callapi];
    
    // Do any additional setup after loading the view.
}

-(void)callapi
{
    NSString *str = @"https://api.androidhive.info/feed/feed.json";
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSArray *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    _tblarray = [temp valueForKey:@"feed"];
    NSLog(@"tblearray =%@",_tblarray);
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    cutTableViewCell *cust = [_tblview dequeueReusableCellWithIdentifier:@"cell123"];
    
    NSString *str = [[_tblarray objectAtIndex:indexPath.row]valueForKey:@"timeStamp"];
    
    double unixTimeStamp =[str doubleValue];
    NSTimeInterval _interval=unixTimeStamp/1000;
    NSDate *dateNew = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"dd/MM/YYYY"];
    NSString *dateString = [formatter stringFromDate:dateNew];
     NSLog(@"dateString = %@",dateString);
    
    

    
    NSString *imgstr = [[_tblarray objectAtIndex:indexPath.row]valueForKey:@"profilePic"];
 

//    if ( ( ![imgstr isEqual:[NSNull null]] ) && ( [imgstr length] != 0 ) )
//    {
//
//    }
//    else
//    {
//        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imgstr]];
//            cust.side_imgview.image = [UIImage imageWithData: imageData];
//    }
    
    
    
    NSURL  *url = [NSURL URLWithString:imgstr];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    if ( urlData )
    {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"dwnld_image.png"];
        [urlData writeToFile:filePath atomically:YES];
        UIImage *image1=[UIImage imageWithContentsOfFile:filePath];
        cust.side_imgview.image = image1;
        NSLog(@"Completed...");
    }
    
     NSString *imgstr1 = [[_tblarray objectAtIndex:indexPath.row]valueForKey:@"image"];
    
    if (imgstr1 != [NSNull null])
    {
     
        NSURL  *url = [NSURL URLWithString:imgstr1];
        NSData *urlData = [NSData dataWithContentsOfURL:url];
        if ( urlData )
        {
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"dwnld_image.png"];
            [urlData writeToFile:filePath atomically:YES];
            UIImage *image1=[UIImage imageWithContentsOfFile:filePath];
            cust.detail_imgview.image = image1;
            NSLog(@"Completed...");
        }
    }
    else
    {
        
    }
    
    
    
    cust.title_lbl.text = [[_tblarray objectAtIndex:indexPath.row]valueForKey:@"name"];
    
    cust.time_lbl.text = dateString;
      cust.description_lbl.text = [[_tblarray objectAtIndex:indexPath.row]valueForKey:@"status"];
    
     return  cust;
     
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tblarray.count;
}




@end
