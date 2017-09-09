//
//  LinkableProtocol.h
//  LinkableLabel
//
//  Created by Alex Moiseenko on 9/9/17.
//  Copyright © 2017 Alex Moiseenko. All rights reserved.
//

#ifndef LinkableProtocol_h
#define LinkableProtocol_h


@protocol LinkableDelegate <NSObject>

-(void)didTappedOnLink:(Link*)link;

@end

#endif /* LinkableProtocol_h */
