//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Wo Jun Feng on 9/8/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISShoppingCart.h"
//#import "FISItem.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents{
    FISItem *item = [[FISItem alloc]init];
    NSUInteger sum = 0;
    
    for (item in self.items) {
        sum += item.priceInCents;
    }
    return sum;
};

- (void)addItem:(FISItem *)item{
    [self.items addObject:item];
};

- (void)removeItem:(FISItem *)item{
    [self.items removeObjectAtIndex:[self.items indexOfObject:item]];
};

- (void)removeAllItemsLikeItem:(FISItem *)item{
    [self.items removeObject:item];
};

- (void)sortItemsByNameAsc{
    NSSortDescriptor *sortItemsByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                         ascending:YES];
    
   NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortItemsByNameAsc]];
    self.items = [sortedArray mutableCopy];
    
};

- (void)sortItemsByNameDesc{
    NSSortDescriptor *sortItemsByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                         ascending:NO];
    
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortItemsByNameDesc]];
    self.items = [sortedArray mutableCopy];
};

- (void)sortItemsByPriceInCentsAsc{
    NSSortDescriptor *sortItemsByPriceInCentsAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                          ascending:YES];
    
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortItemsByPriceInCentsAsc]];
    self.items = [sortedArray mutableCopy];
};

- (void)sortItemsByPriceInCentsDesc{
    NSSortDescriptor *sortItemsByPriceInCentsDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                                 ascending:NO];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortItemsByPriceInCentsDesc]];
    self.items = [sortedArray mutableCopy];
};

- (NSArray *)allItemsWithName:(NSString *)arg{
    
    NSPredicate *allItemsWithName = [NSPredicate predicateWithFormat:@"name CONTAINS %@",arg];
    NSArray *items = [self.items filteredArrayUsingPredicate:allItemsWithName];
    
    return items;
};

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)number{
    NSPredicate *allItemsWithMinimumPriceInCents = [NSPredicate predicateWithFormat:@"priceInCents >= %lu",number];
    NSArray *items = [self.items filteredArrayUsingPredicate:allItemsWithMinimumPriceInCents];
    
    return items;
};

- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)number{
    NSPredicate *allItemsWithMaximumPriceInCents = [NSPredicate predicateWithFormat:@"priceInCents <= %lu",number];
    NSArray *items = [self.items filteredArrayUsingPredicate:allItemsWithMaximumPriceInCents];
    
    return items;
};

@end
