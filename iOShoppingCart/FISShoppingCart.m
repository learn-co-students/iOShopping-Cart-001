//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Richard Martin on 2015-11-22.
//  Copyright © 2015 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents {
    
    NSUInteger totalPrice = 0;
    
    for (FISItem *item in self.items) {
        totalPrice += item.priceInCents;
    }
    
    return totalPrice;
}

- (void)addItem:(FISItem *)item {
    
    [self.items addObject:item];
    
}

- (void)removeItem:(FISItem *)item {
    
    NSUInteger indexValue = [self.items indexOfObject:item];
    
    [self.items removeObjectAtIndex:indexValue];
    
}

- (void)removeAllItemsLikeItem:(FISItem *)item {
    
    NSArray *removeItems = @[item];
    
    [self.items removeObjectsInArray:removeItems];
    
    
}

- (void)sortItemsByNameAsc {
    
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                    ascending:YES];
    
    [self.items sortUsingDescriptors:@[sortByNameAsc]];
    
}

- (void)sortItemsByNameDesc {
    
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                    ascending:NO];
    
    [self.items sortUsingDescriptors:@[sortByNameDesc]];
    
    
}

- (void)sortItemsByPriceInCentsAsc {
    
    NSSortDescriptor *sortByPriceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                    ascending:YES];
    
    [self.items sortUsingDescriptors:@[sortByPriceAsc]];
    
}

- (void)sortItemsByPriceInCentsDesc {
    
    NSSortDescriptor *sortByPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                     ascending:NO];
    
    [self.items sortUsingDescriptors:@[sortByPriceDesc]];
    
}

- (NSArray *)allItemsWithName:(NSString *)name {
    
    NSPredicate *nameFilter = [NSPredicate predicateWithFormat:@"name LIKE %@",name];
    
    NSArray *itemsWithName = [self.items filteredArrayUsingPredicate:nameFilter];
    
    return itemsWithName;
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)priceInCents {
    
    NSPredicate *minumumPriceFilter = [NSPredicate predicateWithFormat:@"priceInCents >= %li",priceInCents];
    
    NSArray *itemsWithMinimumPrice = [self.items filteredArrayUsingPredicate:minumumPriceFilter];
    
    return itemsWithMinimumPrice;
    
}

- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)priceInCents {
    
    NSPredicate *maximumPriceFilter = [NSPredicate predicateWithFormat:@"priceInCents <= %li",priceInCents];
    
    NSArray *itemsWithMaximumPrice = [self.items filteredArrayUsingPredicate:maximumPriceFilter];
    
    return itemsWithMaximumPrice;
}


@end
