//
//  TSViewController.m
//  TestBookKeeper
//
//  Created by markw on 11/17/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import "TSViewController.h"
#import "TSGift.h"
#import "TSDetailsViewController.h"
#import "TSGiftsManager.h"


@interface TSViewController ()

@property (nonatomic, strong) NSMutableArray *gifts;
@property (nonatomic, strong) NSString *lastGiftName;
@property (nonatomic, strong) TSGiftsManager *giftsManager;

@end

@implementation TSViewController

- (void)loadGifts
{
    NSArray *gifts = [self.giftsManager loadGifts];
    self.gifts = [NSMutableArray arrayWithArray:gifts];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.giftsManager = [[TSGiftsManager alloc] init];
    self.title = @"My Gifts list";
    [self loadGifts];
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(addNewItem)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)addNewItem {
    
    [self showAlertWithTitle:@"Add new gift" message:@"Enter the gift name" andTag:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return [self.gifts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"giftCell"];
    cell.textLabel.text = [self.gifts[indexPath.row] name];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.gifts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.giftsManager removeGiftWithIndex:indexPath.row];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                    andTag:(NSInteger)tag {
    
    UIAlertView *giftURLAlert = [[UIAlertView alloc] initWithTitle:title
                                                           message:message
                                                          delegate:self
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:@"OK", nil];
    giftURLAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    giftURLAlert.tag = tag;
    [giftURLAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // if OK was selected
    if (buttonIndex == 1) {
        
        // if alertView for gift name
        if (alertView.tag == 1) {
            
            self.lastGiftName = [[alertView textFieldAtIndex:0] text];
            [self showAlertWithTitle:@"Set URL" message:@"add the URL for the gift" andTag:2];
        }
        
        // if alertView for gift URL
        if (alertView.tag == 2) {
            
            TSGift *newGift = [[TSGift alloc] init];
            newGift.name = self.lastGiftName;
            newGift.urlPath = [[alertView textFieldAtIndex:0] text];
            [self.gifts addObject:newGift];
            [self.tableView reloadData];
            [self saveNewGift:newGift];
        }
    }
}

- (void)saveNewGift:(TSGift *)gift {
    
    [self.giftsManager addNewGift:gift];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"detailsSegue"]) {
        NSInteger selectedRow = [[self.tableView indexPathForSelectedRow] row];
        TSGift *gift = self.gifts[selectedRow];
        TSDetailsViewController *detailsVC = [segue destinationViewController];
        detailsVC.urlPath = gift.urlPath;
    }
}

@end
