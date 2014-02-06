//
//  QuerySearchViewController.m
//  InstaGram2
//
//  Created by Jared Friedman on 2/5/14.
//  Copyright (c) 2014 Jared Friedman. All rights reserved.
//

#import "QuerySearchViewController.h"

@interface QuerySearchViewController ()<UISearchBarDelegate>
{
    
    __weak IBOutlet UISearchBar *querySearchbar;
    
}
@end

@implementation QuerySearchViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    querySearchbar.delegate=self;

}
-(PFQuery *)queryForTable
{
    PFQuery *userQuery = [PFUser query];
    [userQuery whereKey:@"username" containsString:querySearchbar.text];
    return userQuery;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self loadObjects];
}

@end
