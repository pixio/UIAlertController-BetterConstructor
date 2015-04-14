//
//  UIAlertController+BetterConstructor.m
//  Favred
//
//  Created by Daniel Blakemore on 11/13/14.
//
//  Copyright (c) 2015 Pixio
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "UIAlertController+BetterConstructor.h"

@implementation UIAlertController (BetterConstructor)

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style cancelButtonTitle:(NSString *)cancelTitle cancelButtonBlock:(alertHandler_t)cancelBlock destructiveButtonTitle:(NSString*)destructiveTitle destructiveButtonBlock:(alertHandler_t)destructiveBlock otherButtonTitlesAndBlocks:(id)otherTitlesAndBlocks, ... NS_REQUIRES_NIL_TERMINATION
{
    UIAlertController * ac = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    if(ac)
    {        
        NSString * buttonTitle;
        alertHandler_t buttonBlock;
        va_list argumentList;
        
        if (otherTitlesAndBlocks)
        {
            va_start(argumentList, otherTitlesAndBlocks);
            NSString * first = otherTitlesAndBlocks;
            while (TRUE) {
                // get title
                buttonTitle = first ?: va_arg(argumentList, NSString *);
                first = nil;
                if (!buttonTitle) {
                    // no more args
                    break;
                }
                
                NSAssert([buttonTitle isKindOfClass:[NSString class]], @"Button titles must be strings.");
                
                // get block
                buttonBlock = va_arg(argumentList, alertHandler_t);
                
                // WRONG (maybe)
                NSAssert(buttonBlock, @"If a title is specified, so must a block be.");
                
                // make action and add to ac
                UIAlertAction * action = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:buttonBlock];
                [action setEnabled:!(buttonBlock == DisabledBlock)];
                [ac addAction:action];
            }
            va_end(argumentList);
        }
        
        if(destructiveTitle)
        {
            UIAlertAction * action = [UIAlertAction actionWithTitle:destructiveTitle style:UIAlertActionStyleDestructive handler:destructiveBlock?:^(UIAlertAction*a){}];
            [action setEnabled:!(buttonBlock == DisabledBlock)];
            [ac addAction:action];
        }
        
        if(cancelTitle)
        {
            UIAlertAction * action = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:cancelBlock?:^(UIAlertAction*a){}];
            [action setEnabled:!(buttonBlock == DisabledBlock)];
            [ac addAction:action];
        }
    }
    return ac;
}

@end

alertHandler_t const DisabledBlock = ^(UIAlertAction * nope){};