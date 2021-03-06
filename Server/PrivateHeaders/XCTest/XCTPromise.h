// class-dump results processed by bin/class-dump/dump.rb
//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Jul 30 2018 09:07:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <XCTest/XCUIElementTypes.h>
#import "CDStructures.h"
@protocol OS_dispatch_queue;
@protocol OS_xpc_object;

#import <objc/NSObject.h>

@class NSError, NSString, XCTestExpectation;

@interface XCTPromise : NSObject
{
    // Error parsing type: {atomic_flag="_Value"AB}, name: _promiseFulfilled
    NSError *_error;
    id _value;
    XCTestExpectation *_expectation;
    NSString *_promiseDescription;
}

@property(retain) NSError *error;
@property(readonly) XCTestExpectation *expectation;
@property(readonly, copy) NSString *promiseDescription;
@property(retain) id value;

- (void)fulfillWithError:(id)arg1;
- (void)fulfillWithValue:(id)arg1;
- (void)fulfillWithValue:(id)arg1 error:(id)arg2;
- (id)initWithDescription:(id)arg1;
// Error parsing type for property promiseFulfilled:
// Property attributes: T{atomic_flag=AB},R,V_promiseFulfilled


@end

