//
//  TableViewController.m
//  Oefening-UITableView-1
//
//  Created by Jean Smits on 19/08/15.
//  Copyright (c) 2015 EASI. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "MatchFactory.h"

@interface TableViewController ()

@property (strong, nonatomic) NSArray* arrayMatches;
@property (strong, nonatomic) NSMutableArray* arrayMatchesNotPlayedYet;
@property (strong, nonatomic) NSMutableArray* arrayMatchesOngoing;
@property (strong, nonatomic) NSMutableArray* arrayMatchesPlayed;


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayMatches = [MatchFactory createMatches];
    for (int i; i< self.arrayMatches.count; i++)  {
        Match*match = self.arrayMatches[i];

        if (match.status == MatchStatusNotPlayedYet) {
            [self.arrayMatchesNotPlayedYet addObject:self.arrayMatches[i]];
        } else if (match.status == MatchStatusOngoing)  {
            [self.arrayMatchesOngoing addObject:self.arrayMatches[i]];
        } else if (match.status == MatchStatusPlayed)   {
            [self.arrayMatchesPlayed addObject: self.arrayMatches[i]];
        }
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section ==1)    {
        return self.arrayMatchesPlayed.count;
    } else if(section ==2)  {
        return self.arrayMatchesOngoing.count;
    } else if(section ==3)  {
        return self.arrayMatchesNotPlayedYet.count;
    } else {
        return self.arrayMatches.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"team cell" forIndexPath:indexPath];
    Match* match = self.arrayMatches[indexPath.row];
    
    [cell matchMaking:match];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
