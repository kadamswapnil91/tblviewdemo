//
//  cutTableViewCell.h
//  tblviewdemo
//
//  Created by mac on 2/11/20.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface cutTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@property (weak, nonatomic) IBOutlet UIImageView *side_imgview;
@property (weak, nonatomic) IBOutlet UILabel *title_lbl;
@property (weak, nonatomic) IBOutlet UILabel *time_lbl;
@property (weak, nonatomic) IBOutlet UILabel *description_lbl;
@property (weak, nonatomic) IBOutlet UIImageView *detail_imgview;

@end

NS_ASSUME_NONNULL_END
