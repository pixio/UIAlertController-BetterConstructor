//
//  UIAlertController+BetterConstructor.h
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

#import <UIKit/UIKit.h>

typedef void (^alertHandler_t)(UIAlertAction *action);

/**
 *  A category adding a shorthand constructor to prevent creating a bunch of action objects.
 */
@interface UIAlertController (BetterConstructor)

/**
 *  Create a new alert controller with blocks to handle buttons.
 *
 *  This eliminates the need to choose styles or even instantiate actions.
 *  All buttons other than cancel and the destructive button are specified in a nil-terminated list of alternatiting titles and blocks.
 *  @note Using the predefined `DisabledBlock' will set that action to disabled.
 *
 *  @param title                the alert controller title
 *  @param message              the message
 *  @param style                the alert controller style
 *  @param cancelTitle          the title for a cancel button, if any
 *  @param cancelBlock          the block for the cancel button
 *  @param destructiveTitle     the title for a distructive button, if any
 *  @param destructiveBlock     the block for the distructive button
 *  @param otherTitlesAndBlocks a list of alternating NSString titles and blocks for any other actions.
 *
 *  @return an alert controller all ready to go without all the initialization/styling hastle of actions
 */
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style cancelButtonTitle:(NSString *)cancelTitle cancelButtonBlock:(alertHandler_t)cancelBlock destructiveButtonTitle:(NSString*)destructiveTitle destructiveButtonBlock:(alertHandler_t)destructiveBlock otherButtonTitlesAndBlocks:(id)otherTitlesAndBlocks, ... NS_REQUIRES_NIL_TERMINATION;

@end

extern alertHandler_t const DisabledBlock;
