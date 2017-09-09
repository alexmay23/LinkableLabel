//
//  Label.h
//  LinkableLabel
//
//  Created by Alex Moiseenko on 9/9/17.
//  Copyright © 2017 Alex Moiseenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Link.h"
#import "LinkableProtocol.h"

@interface LinkableLabel : UILabel

@property (nonatomic, nullable, weak) id<LinkableDelegate>  delegate;

-(void)appendLink:(Link *_Nonnull)link;

@end
