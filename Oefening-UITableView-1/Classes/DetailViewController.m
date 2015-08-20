//
//  DetailViewController.m
//  Oefening-UITableView-1
//
//  Created by Jean Smits on 20/08/15.
//  Copyright (c) 2015 EASI. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *homeTeamLabel;
@property (weak, nonatomic) IBOutlet UIImageView *homeTeamImage;
@property (weak, nonatomic) IBOutlet UILabel *vistingTeamLabel;
@property (weak, nonatomic) IBOutlet UIImageView *visitingTeamImage;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homeTeamLabel.text = self.match.homeTeamName;
    self.vistingTeamLabel.text = self.match.visitingTeamName;
    self.homeTeamImage.image = [UIImage imageNamed:self.match.homeTeamImageName];
    self.visitingTeamImage.image = [UIImage imageNamed:self.match.visitingTeamImageName];
    
    if (self.match.status == MatchStatusPlayed) {
        self.statusLabel.text = @"finished";
        self.scoreLabel.text = [NSString stringWithFormat:@"%lu - %lu",(unsigned long)self.match.homeTeamScore, self.match.visitingTeamScore];
    }   else if(self.match.status == MatchStatusOngoing)    {
        self.statusLabel.text = @"ongoing";
        self.scoreLabel.text = [NSString stringWithFormat:@"%lu - %lu",(unsigned long)self.match.homeTeamScore, self.match.visitingTeamScore];
    }   else if(self.match.status == MatchStatusNotPlayedYet)   {
        self.statusLabel.text = @"not yet played";
        self.scoreLabel.hidden = YES;
    }

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
