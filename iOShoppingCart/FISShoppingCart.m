//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by JASON HARRIS on 9/23/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents {
    //calculateTotalPriceInCents should calculate the sum of the priceInCents property of all the items in the items array. Naturally, this should return 0 if the items array is empty.
    NSUInteger totalPriceInCents = 0;
    for (FISItem *itemZ in self.items){
        totalPriceInCents += itemZ.priceInCents;
    }
    return totalPriceInCents;
}

- (void)addItem: (FISItem *)item {
    //addItem: should add the submitted item to the items array, even if the item is already in the items array (sometimes you just need to stock up on hot pockets!).
    [self.items addObject:item];
}

- (void)removeItem: (FISItem *)item{
    //removeItem: should remove a single occurrence of an item in the items array.
    //Hint: Use NSMutableArray's indexOfObject: andremoveObjectAtIndex: method.
    [self.items removeObjectAtIndex: [self.items indexOfObject:item]];
}

- (void)removeAllItemsLikeItem: (FISItem *)item{
    //removeAllItemsLikeItem: should remove all occurrences of an item in the items array.
    [self.items removeObjectIdenticalTo:item]; //used dropdown menu to find this one
}

- (void)sortItemsByNameAsc{
    //    sortItemsByNameAsc should sort the contents of the items array by their name property in ascending order (alphabetical).
    //Hint: Use NSSortDescriptor for these methods.
    NSSortDescriptor *sortingAscending = [NSSortDescriptor  sortDescriptorWithKey:@"name"
                                                                     ascending:YES];
    NSMutableArray *newMutableArray = [[self.items sortedArrayUsingDescriptors:@[sortingAscending]] mutableCopy];
    self.items = newMutableArray;
}

- (void)sortItemsByNameDesc{
    //sortItemsByNameDesc should sort the contents of the items array by their name property in descending order.
    NSSortDescriptor *sortingAscending = [NSSortDescriptor  sortDescriptorWithKey:@"name"
                                                                        ascending:NO];
    NSMutableArray *newMutableArray = [[self.items sortedArrayUsingDescriptors:@[sortingAscending]] mutableCopy];
    self.items = newMutableArray;
}

- (void)sortItemsByPriceInCentsAsc{
    //    sortItemsByPriceInCentsAsc should sort the contents of the items array by the priceInCents property in ascending order.
    NSSortDescriptor *sortingAscending = [NSSortDescriptor  sortDescriptorWithKey:@"priceInCents"
                                                                        ascending:YES];
    NSMutableArray *newMutableArray = [[self.items sortedArrayUsingDescriptors:@[sortingAscending]] mutableCopy];
    self.items = newMutableArray;
}

- (void)sortItemsByPriceInCentsDesc{
    //    sortItemsByPriceInCentsDesc should sort the the contents of the items array by the priceInCents property in descending order.
    NSSortDescriptor *sortingAscending = [NSSortDescriptor  sortDescriptorWithKey:@"priceInCents"
                                                                        ascending:NO];
    NSMutableArray *newMutableArray = [[self.items sortedArrayUsingDescriptors:@[sortingAscending]] mutableCopy];
    self.items = newMutableArray;
    
}

- (NSArray *)allItemsWithName: (NSString *)name{
    //allItemsWithName: should return an array containing only the items whose name property matches the argument string.
    //Hint: Use NSPredicate for these methods.
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"name LIKE %@",name];
    NSArray     *arrayFiltering  = [self.items filteredArrayUsingPredicate:searchPredicate];
    return arrayFiltering;
}

- (NSArray *)allItemsWithMinimumPriceInCents: (NSUInteger)arguement{
    //    allItemsWithMinimumPriceInCents: should return an array containing only the items whose priceInCents property is greater than or equal to the argument integer.
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %u",arguement];
    NSArray     *arrayFiltering  = [self.items filteredArrayUsingPredicate:searchPredicate];
    return arrayFiltering;
}

- (NSArray *)allItemsWithMaximumPriceInCents: (NSUInteger)arguement{
    //allItemsWithMaximumPriceInCents: should return an array containing only those items whose priceInCents property is less than or equal to the argument integer.
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %u",arguement];
    NSArray     *arrayFiltering  = [self.items filteredArrayUsingPredicate:searchPredicate];
    return arrayFiltering;
    
    return nil;
}







@end
