//
//  TableViewCell.m
//  Oefening-UITableView-1
//
//  Created by Jean Smits on 19/08/15.
//  Copyright (c) 2015 EASI. All rights reserved.
//

#import "TableViewCell.h"
#import "TableViewCellHeader.h"
@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) matchMaking:(Match *)match {
    self.teamNameLabel.text = match.homeTeamName;
    self.visitingTeamName.text = match.visitingTeamName;

    self.homeTeamImage.image = [UIImage imageNamed:match.homeTeamImageName];
    self.visitingTeamImage.image = [UIImage imageNamed:match.visitingTeamImageName];

    if (match.status == MatchStatusNotPlayedYet) {
        self.scoreLabel.font = [self.scoreLabel.font fontWithSize:9];
        self.scoreLabel.textColor = [UIColor lightGrayColor];
        self.scoreLabel.text = @"not played yet";

    } else if (match.status == MatchStatusOngoing)    {
        self.scoreLabel.textColor = [UIColor redColor];
        self.scoreLabel.text = [NSString stringWithFormat:@"%lu - %lu",(unsigned long)match.homeTeamScore, match.visitingTeamScore];
        
    } else  {
        self.scoreLabel.text = [NSString stringWithFormat:@"%lu - %lu",(unsigned long)match.homeTeamScore, match.visitingTeamScore];
    }
    
    
}



@end
