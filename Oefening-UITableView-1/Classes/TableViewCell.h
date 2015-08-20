//
//  TableViewCell.h
//  Oefening-UITableView-1
//
//  Created by Jean Smits on 19/08/15.
//  Copyright (c) 2015 EASI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Match.h"
@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *visitingTeamImage;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *visitingTeamName;
@property (weak, nonatomic) IBOutlet UIImageView *homeTeamImage;



- (void) matchMaking: (Match*) match;


@end
