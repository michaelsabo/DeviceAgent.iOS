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

#import "XCTestExpectation.h"

#import "XCTestExpectationDelegate-Protocol.h"

@class NSArray, NSString, _XCTCompoundExpectationImplementation;

@interface XCTCompoundExpectation : XCTestExpectation <XCTestExpectationDelegate>
{
    id _internalCompoundExpectation;
}

@property(readonly) _XCTCompoundExpectationImplementation *internalCompoundExpectation;
@property(readonly) NSUInteger logicalType;
@property(readonly, copy) NSArray *subexpectations;

- (BOOL)_queue_validateSubexpectationsFulfillment;
- (void)_updateFulfilledState;
- (void)cleanup;
- (void)didFulfillExpectation:(id)arg1;
- (id)initWithLogicalType:(NSUInteger)arg1 subexpectations:(id)arg2;


@end

