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

@class NSError, NSMutableSet, XCTPromise, XCTWaiter;

@interface XCTFuture : NSObject
{
    BOOL _hasWaited;
    BOOL _hasFinished;
    double _deadline;
    XCTPromise *_promise;
    XCTWaiter *_waiter;
    NSMutableSet *_cancelationExpectations;
    id _value;
    NSError *_error;
}

@property(readonly) NSMutableSet *cancelationExpectations;
@property(readonly) double deadline;
@property(retain) NSError *error;
@property BOOL hasFinished;
@property BOOL hasWaited;
@property(readonly) XCTPromise *promise;
@property(retain) id value;
@property(readonly) XCTWaiter *waiter;

+ (id)futureWithDescription:(id)arg1 block:(CDUnknownBlockType)arg2;
+ (id)futureWithTimeout:(double)arg1 description:(id)arg2 block:(CDUnknownBlockType)arg3;
+ (BOOL)isCancelationOrInterruptionError:(id)arg1;
- (void)_waitForFulfillment;
- (void)addCancelationExpectation:(id)arg1;
- (id)initWithTimeout:(double)arg1 promise:(id)arg2;

@end

