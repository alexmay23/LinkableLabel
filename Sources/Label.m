//
//  Label.m
//  LinkableLabel
//
//  Created by Alex Moiseenko on 9/9/17.
//  Copyright © 2017 Alex Moiseenko. All rights reserved.
//

#import "Label.h"




@interface LinkableLabel ()

@property (nonatomic) NSMutableDictionary<NSString*,Link *>* links;

@property (nonatomic) NSTextStorage *textStorage;

@property (nonatomic) NSTextContainer *textContainer;

@property (nonatomic) NSLayoutManager *layoutManager;

@end


@implementation LinkableLabel

@synthesize delegate, links;


-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}


-(void)initialize{
    self.links = [[NSMutableDictionary alloc] init];
}


-(void)appendLink:(Link *)link{
    [self.links setObject:link forKey:link.value];
}


-(void)setupLinksDetector:(NSAttributedString *)attributedString
{
    self.layoutManager = [[NSLayoutManager alloc] init];
    self.textContainer = [[NSTextContainer alloc] initWithSize:self.bounds.size];
    self.textStorage = [[NSTextStorage alloc] initWithAttributedString:attributedString];
    
    [self.layoutManager addTextContainer:self.textContainer];
    [self.textStorage addLayoutManager:self.layoutManager];
    
    self.textContainer.lineFragmentPadding = 0.0;
    self.textContainer.lineBreakMode = self.lineBreakMode;
    self.textContainer.maximumNumberOfLines = self.numberOfLines;
}

-(void)attributeText:(NSMutableAttributedString *)attributed{
    for (NSString *v in self.links.allKeys){
        Link *link =  [self.links objectForKey:v];
        link.range = [attributed.string rangeOfString:link.value];
        [attributed addAttributes:link.attributes range:link.range];
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *first = [[touches allObjects] firstObject];
    CGPoint locationOfTouch =  [first locationInView: self];
    
    CGRect textBoundingBox = [self.layoutManager usedRectForTextContainer:self.textContainer];
    if (!CGRectContainsPoint(CGRectInset(textBoundingBox, -5.0, -5.0) , locationOfTouch)){
        [super touchesBegan:touches withEvent:event];
        return;
    }
    NSInteger index  = [self.layoutManager characterIndexForPoint:locationOfTouch inTextContainer: self.textContainer fractionOfDistanceBetweenInsertionPoints:nil];
    Link * detected = [self detectedLink:index];
    if (detected != nil){
        if (delegate && [delegate respondsToSelector:@selector(didTappedOnLink:)]){
            [delegate didTappedOnLink:detected];
        }
    }
    else
    {
        [super touchesBegan:touches withEvent:event];
    }
}


-(Link *)detectedLink:(NSInteger)index{
    for (Link * link in self.links.allValues){
        if (NSLocationInRange(index, link.range)){
            return link;
        }
    }
    return nil;
}


-(void)setText:(NSString *)text{
    NSMutableAttributedString * attributed = [[NSMutableAttributedString alloc] initWithString:text];
    [self attributeText:attributed];
    [self setupLinksDetector:attributed];
    [super setAttributedText:attributed];
}


-(void)setAttributedText:(NSAttributedString *)attributedText{
    NSMutableAttributedString * attributed = [[NSMutableAttributedString alloc] initWithAttributedString:attributedText];
    [self attributeText:attributed];
    [self setupLinksDetector:attributed];
    [super setAttributedText:attributed];
}


@end
