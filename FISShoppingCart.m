//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Joshua Motley on 1/20/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents{
    NSUInteger result=0;
    for (FISItem *item in self.items) {
        result+=item.priceInCents;
    }

    
    return result;
};
-(void)addItem:(FISItem *)item{
    
    [self.items addObject:item];

};
-(void)removeItem:(FISItem *)item{
    
    [self.items removeObjectAtIndex:[self.items indexOfObject:item]];
    
};
-(void)removeAllItemsLikeItem:(FISItem *)item{
    

            [self.items removeObject:item];

    
};
-(void)sortItemsByNameAsc{
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *sortArray = [NSArray arrayWithObject:sort];
    [self.items sortUsingDescriptors:sortArray];
    
};
-(void)sortItemsByNameDesc{
   
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    NSArray *sortArray = [NSArray arrayWithObject:sort];
    [self.items sortUsingDescriptors:sortArray];
    
};
-(void)sortItemsByPriceInCentsAsc{
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    NSArray *sortArray = [NSArray arrayWithObject:sort];
    [self.items sortUsingDescriptors:sortArray];
    
};
-(void)sortItemsByPriceInCentsDesc{
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    NSArray *sortArray = [NSArray arrayWithObject:sort];
    [self.items sortUsingDescriptors:sortArray];
    
};
-(NSArray *)allItemsWithName:(NSString *)name{
   
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (FISItem *item in self.items) {

    if ([item.name isEqualToString:name] ) {
        [result addObject:item];
    }
        
    }
    
    return result;
};
-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)cents{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (FISItem *item in self.items) {
        
        if (item.priceInCents >= cents){
            [result addObject:item];
        }
        
    }
    
    return result;
};
-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)cents{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (FISItem *item in self.items) {
        
        if (item.priceInCents <= cents){
            [result addObject:item];
        }
        
    }
    
    return result;
};

@end
