//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Stacy Johnson on 10/26/15.
//  Copyright © 2015 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger) calculateTotalPriceInCents {
 
    NSUInteger totalPrice = 0;
    
    if (self.items && self.items.count) {
        //Calculate theh total price
        for (FISItem *item in self.items) {
            totalPrice += item.priceInCents;
        }
    }
    
    return totalPrice;
}

-(void) addItem:(FISItem *)item {
    
    [self.items addObject:item];
}

-(void) removeItem:(FISItem *)item {
    
    if (self.items && self.items.count) {
        NSUInteger locFirstItem = [self.items indexOfObject:item];
        if (locFirstItem != NSNotFound) {
            [self.items removeObjectAtIndex:locFirstItem];
        }
    }
    
}

-(void) removeAllItemsLikeItem:(FISItem *)item {
    
    if (self.items && self.items.count) {
        [self.items removeObject:item];
    }
}

-(void) sortItemsByNameAsc {
    
    NSSortDescriptor *itemsInAscDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[itemsInAscDescriptor]] mutableCopy];
    
    
}

-(void) sortItemsByNameDesc {
    
    NSSortDescriptor *itemsInDescDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[itemsInDescDescriptor]] mutableCopy];
}

-(void) sortItemsByPriceInCentsAsc {
    
    NSSortDescriptor *itemsInAscPriceDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                                ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[itemsInAscPriceDescriptor]] mutableCopy];
    
}

-(void) sortItemsByPriceInCentsDesc {
    
    NSSortDescriptor *itemsInDescPriceDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                                ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[itemsInDescPriceDescriptor]] mutableCopy];
    
}

-(NSArray *) allItemsWithName:(NSString *)name {
    
    NSPredicate *filterByName = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    
    return [self.items filteredArrayUsingPredicate:filterByName];
}

-(NSArray *) allItemsWithMinimumPriceInCents:(NSUInteger)price {
  
    NSPredicate *filterByPrice = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", price];
    
    return [self.items filteredArrayUsingPredicate:filterByPrice];
}

-(NSArray *) allItemsWithMaximumPriceInCents:(NSUInteger)price {
 
    NSPredicate *filterByPrice = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", price];

    return [self.items filteredArrayUsingPredicate:filterByPrice];
}

@end
