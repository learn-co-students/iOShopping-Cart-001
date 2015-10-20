//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Alex J Lee on 10/17/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISShoppingCart.h"
#import "FISItem.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents{
    NSUInteger sum = 0;
    FISItem *item = [[FISItem alloc]init];
    
    for (item in self.items){
        sum += item.priceInCents;
    }
    return sum;
}

-(void)addItem:(FISItem *)item{
    [self.items addObject: item];
}

-(void)removeItem:(FISItem *)item{
    NSUInteger firstOccurence = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:firstOccurence];
}

-(void)removeAllItemsLikeItem:(FISItem *)item{
    [self.items removeObjectIdenticalTo:item];
}

-(void)sortItemsByNameAsc{
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:true];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortAsc]];
    self.items = [sortedArray mutableCopy];
}

-(void)sortItemsByNameDesc{
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey: @"name" ascending: false];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortDesc]];
    self.items = [sortedArray mutableCopy];
}

-(void)sortItemsByPriceInCentsAsc{
    NSSortDescriptor *sortCentAsc = [NSSortDescriptor sortDescriptorWithKey: @"priceInCents" ascending:true];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortCentAsc]];
    self.items = [sortedArray mutableCopy];
}

-(void)sortItemsByPriceInCentsDesc{
    NSSortDescriptor *sortCentDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:false];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortCentDesc]];
    self.items = [sortedArray mutableCopy];
}

-(NSArray *)allItemsWithName:(NSString *)name{
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@", name];
    NSArray *nameFilterArray = [self.items filteredArrayUsingPredicate:namePredicate];
    return nameFilterArray;
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)number {
    NSPredicate *priceMinPredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %lu",number];
    NSArray *priceMinArrayPredicate = [self.items filteredArrayUsingPredicate:priceMinPredicate];
    return priceMinArrayPredicate;
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)number{
    NSPredicate *priceMaxPredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %lu",number];
    NSArray *priceMaxArrayPredicate = [self.items filteredArrayUsingPredicate:priceMaxPredicate];
    return priceMaxArrayPredicate;
}

@end
