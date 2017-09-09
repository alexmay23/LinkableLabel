//
//  Link.h
//  LinkableLabel
//
//  Created by Alex Moiseenko on 9/9/17.
//  Copyright © 2017 Alex Moiseenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Link : NSObject

@property (nonatomic) NSRange range;
@property (nonatomic, nullable) NSDictionary<NSString*, id>* attributes;
@property (nonatomic, nullable) NSString*  value;

@end
