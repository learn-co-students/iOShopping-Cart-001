//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by John Richardson on 5/6/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents {
    NSUInteger total = 0;
    for (NSUInteger i = 0; i < [self.items count]; i++) {
        total = total + [self.items[i] priceInCents];
    }
    return total;
}

- (void)addItem:(FISItem *)item {
    [self.items addObject:item];
}

- (void)removeItem:(FISItem *)item {
    NSUInteger index = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:index];
}

- (void)removeAllItemsLikeItem:(FISItem *)item {
    [self.items removeObject:item];
}

- (void)sortItemsByNameAsc {
    NSSortDescriptor *itemsByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:itemsByNameAsc, nil];
    [self.items sortUsingDescriptors:sortDescriptors];

}

- (void)sortItemsByNameDesc {
    NSSortDescriptor *itemsByNameDesc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:itemsByNameDesc, nil];
    [self.items sortUsingDescriptors:sortDescriptors];
}

- (void)sortItemsByPriceInCentsAsc {
    NSSortDescriptor *itemsByPriceInCentsAsc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:itemsByPriceInCentsAsc, nil];
    [self.items sortUsingDescriptors:sortDescriptors];
}

- (void)sortItemsByPriceInCentsDesc {
    NSSortDescriptor *itemsByPriceInCentsDesc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:itemsByPriceInCentsDesc, nil];
    [self.items sortUsingDescriptors:sortDescriptors];
}

- (NSArray *)allItemsWithName:(NSString *)name {
    return nil;
    
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)cents {
    return nil;
    
}

- (NSArray *)allItemsWithMaximumPriceInCents:(NSInteger)cents {
    return nil;
}

@end
