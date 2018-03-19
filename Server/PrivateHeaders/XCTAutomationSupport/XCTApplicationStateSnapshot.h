// class-dump results processed by bin/class-dump/dump.rb
//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//




#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <XCTest/XCUIElementTypes.h>
#import "CDStructures.h"
@protocol OS_dispatch_queue;
@protocol OS_xpc_object;

@interface XCTApplicationStateSnapshot : NSObject <NSSecureCoding>
{
    NSInteger _processID;
    NSString *_bundleID;
    NSString *_path;
    NSUInteger _runState;
    NSUInteger _activationPolicy;
    NSUInteger _eventID;
}

@property(readonly) NSUInteger activationPolicy;
@property(readonly, copy) NSString *bundleID;
@property(readonly) NSUInteger eventID;
@property(readonly, copy) NSString *path;
@property(readonly) NSInteger processID;
@property(readonly) NSUInteger runState;

- (id)initWithBundleID:(id)arg1 path:(id)arg2 runState:(NSUInteger)arg3 processID:(NSInteger)arg4 activationPolicy:(NSUInteger)arg5 eventID:(NSUInteger)arg6;

@end
