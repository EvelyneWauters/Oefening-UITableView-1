//
//  MatchFactory.m
//  Oefening-UITableView-1
//
//  Created by Jonathan Provo on 19/08/15.
//  Copyright (c) 2015 EASI. All rights reserved.
//

#import "MatchFactory.h"

#import "Match.h"

#import <UIKit/UIKit.h>

@interface MatchFactory ()

+ (NSArray *)teamNames;
+ (MatchStatus)randomStatus;
+ (NSUInteger)randomScore;

+ (NSArray *)shuffleArray:(NSArray *)array;

@end

@implementation MatchFactory

#pragma mark - Public methods

+ (NSArray *)createMatches
{
    NSMutableArray *matches = [NSMutableArray array];
    NSArray *teamNames = [self teamNames];
    for (NSUInteger i = 0; i < teamNames.count; i += 2) {
        
        Match *match = [Match new];
        match.homeTeamName = teamNames[i];
        match.homeTeamScore = [self randomScore];
        match.visitingTeamName = teamNames[i + 1];
        match.visitingTeamScore = [self randomScore];
        match.status = [self randomStatus];
        
        [matches addObject:match];
    }
    
    return matches;
}

#pragma mark - Private methods

+ (NSArray *)teamNames
{
    return [self shuffleArray:@[
                                @"STVV",
                                @"Racing Genk",
                                @"Zulte Waregem",
                                @"Club Brugge",
                                @"Waasland-Beveren",
                                @"Moeskroen-P.",
                                @"KV Mechelen",
                                @"OH Leuven",
                                @"Charleroi",
                                @"Westerlo",
                                @"Anderlecht",
                                @"Lokeren",
                                @"Standard",
                                @"Oostende",
                                @"Kortrijk",
                                @"AA Gent"
                                ]];
}

+ (MatchStatus)randomStatus
{
    return arc4random_uniform(3);
}

+ (NSUInteger)randomScore
{
    return arc4random_uniform(4);
}

+ (NSArray *)shuffleArray:(NSArray *)array
{
    NSMutableArray *shuffledArray = [NSMutableArray arrayWithArray:array];
    
    NSUInteger count = array.count;
    for (NSUInteger i = 0; i < count - 1; i++) {
        NSInteger remainingCount = count - i;
        NSInteger randomIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [shuffledArray exchangeObjectAtIndex:i withObjectAtIndex:randomIndex];
    }
    
    return shuffledArray;
}

@end
