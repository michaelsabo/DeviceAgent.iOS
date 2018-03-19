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

#import "XCTest.h"

#import "XCTActivity-Protocol.h"
#import "XCTMemoryCheckerDelegate-Protocol.h"
#import "XCTWaiterDelegate-Protocol.h"

@class NSDictionary, NSInvocation, NSString, XCTMemoryChecker, XCTestCaseRun, XCUITestContext, _XCTestCaseImplementation;

@interface XCTestCase : XCTest <XCTWaiterDelegate, XCTMemoryCheckerDelegate, XCTActivity>
{
    id _internalImplementation;
    XCTMemoryChecker *_defaultMemoryChecker;
}

@property(readonly) NSDictionary *activityAggregateStatistics;
@property(readonly) NSUInteger activityRecordStackDepth;
@property BOOL continueAfterFailure;
@property(retain, nonatomic) XCTMemoryChecker *defaultMemoryChecker;
@property(retain) _XCTestCaseImplementation *internalImplementation;
@property(retain) NSInvocation *invocation;
@property(readonly, copy) NSString *name;
@property(nonatomic) BOOL shouldHaltWhenReceivesControl;
@property(retain) XCTestCaseRun *testCaseRun;
@property(readonly) XCUITestContext *testContext;

+ (void)_allTestMethodInvocations:(id)arg1;
+ (id)_baselineDictionary;
+ (BOOL)_enableSymbolication;
+ (BOOL)_reportPerformanceFailuresForLargeImprovements;
+ (id)_testStartActvityDateFormatter;
+ (BOOL)_treatMissingBaselinesAsTestFailures;
+ (id)allSubclasses;
+ (id)allTestMethodInvocations;
+ (id)bundle;
+ (id)defaultPerformanceMetrics;
+ (id)defaultTestSuite;
+ (BOOL)isInheritingTestCases;
+ (id)knownMemoryMetrics;
+ (id)measurementFormatter;
+ (id)performFailableBlock:(CDUnknownBlockType)arg1 shouldInterruptTest:(BOOL *)arg2;
+ (void)setUp;
+ (void)tearDown;
+ (id)testCaseWithInvocation:(id)arg1;
+ (id)testCaseWithSelector:(SEL)arg1;
+ (id)testInvocations;
+ (id)testMethodInvocations;
- (void)_addExpectation:(id)arg1;
- (void)_addTeardownBlock:(CDUnknownBlockType)arg1;
- (void)_dequeueAndReportBackgroundAttachments;
- (void)_dequeueFailures;
- (id)_dequeueTeardownBlocks;
- (BOOL)_didMeasureMetrics;
- (BOOL)_didStartMeasuring;
- (BOOL)_didStopMeasuring;
- (void)_enqueueFailureWithDescription:(id)arg1 inFile:(id)arg2 atLine:(NSUInteger)arg3 expected:(BOOL)arg4 breakWhenDequeued:(BOOL)arg5;
- (id)_expectationForDarwinNotification:(id)arg1;
- (void)_interruptTest;
- (BOOL)_isMeasuringMetrics;
- (void)_logAndReportPerformanceMetrics:(id)arg1 perfMetricResultsForIDs:(id)arg2 withBaselinesForTest:(id)arg3;
- (void)_logAndReportPerformanceMetrics:(id)arg1 perfMetricResultsForIDs:(id)arg2 withBaselinesForTest:(id)arg3 defaultBaselinesForPerfMetricID:(id)arg4;
- (void)_logMemoryGraphData:(id)arg1 withTitle:(id)arg2;
- (void)_logMemoryGraphDataFromFilePath:(id)arg1 withTitle:(id)arg2;
- (id)_perfMetricsForID;
- (void)_performTearDownSequenceWithSelector:(SEL)arg1;
- (void)_performTurningExceptionsIntoFailuresInterruptAfterHandling:(BOOL)arg1 block:(CDUnknownBlockType)arg2;
- (void)_purgeTeardownBlocks;
- (void)_recordActivityWithFailure:(id)arg1;
- (void)_recordFailure:(id)arg1;
- (void)_recordFailureWithDescription:(id)arg1 inFile:(id)arg2 atLine:(NSUInteger)arg3 expected:(BOOL)arg4;
- (void)_recordValues:(id)arg1 forPerformanceMetricID:(id)arg2 name:(id)arg3 unitsOfMeasurement:(id)arg4 baselineName:(id)arg5 baselineAverage:(id)arg6 maxPercentRegression:(id)arg7 maxPercentRelativeStandardDeviation:(id)arg8 maxRegression:(id)arg9 maxStandardDeviation:(id)arg10 file:(id)arg11 line:(NSUInteger)arg12;
- (void)_reportFailuresAtFile:(id)arg1 line:(NSUInteger)arg2 forTestAssertionsInScope:(CDUnknownBlockType)arg3;
- (void)_reportFailuresForUnwaitedExpectations;
- (Class)_requiredTestRunBaseClass;
- (void)_runTeardownBlocks;
- (id)_symbolicationRecordForTestCodeInAddressStack:(id)arg1;
- (void)addAttachment:(id)arg1;
- (void)addTeardownBlock:(CDUnknownBlockType)arg1;
- (id)addUIInterruptionMonitorWithDescription:(id)arg1 handler:(CDUnknownBlockType)arg2;
- (void)afterTestIteration:(NSUInteger)arg1 selector:(SEL)arg2;
- (void)assertInvalidObjectsDeallocatedAfterScope:(CDUnknownBlockType)arg1;
- (void)assertNoLeaksInApplication:(id)arg1 inScope:(CDUnknownBlockType)arg2;
- (void)assertNoLeaksInScope:(CDUnknownBlockType)arg1;
- (void)assertObjectsOfType:(id)arg1 inApplication:(id)arg2 invalidAfterScope:(CDUnknownBlockType)arg3;
- (void)assertObjectsOfType:(id)arg1 invalidAfterScope:(CDUnknownBlockType)arg2;
- (id)baselinesDictionaryForTest;
- (void)beforeTestIteration:(NSUInteger)arg1 selector:(SEL)arg2;
- (id)bundle;
- (id)expectationForNotification:(id)arg1 object:(id)arg2 handler:(CDUnknownBlockType)arg3;
- (id)expectationForPredicate:(id)arg1 evaluatedWithObject:(id)arg2 handler:(CDUnknownBlockType)arg3;
- (id)expectationWithDescription:(id)arg1;
- (id)initWithInvocation:(id)arg1;
- (id)initWithSelector:(SEL)arg1;
- (void)invokeTest;
- (id)keyValueObservingExpectationForObject:(id)arg1 keyPath:(id)arg2 expectedValue:(id)arg3;
- (id)keyValueObservingExpectationForObject:(id)arg1 keyPath:(id)arg2 handler:(CDUnknownBlockType)arg3;
- (id)languageAgnosticTestMethodName;
- (void)markInvalid:(id)arg1;
- (void)measureBlock:(CDUnknownBlockType)arg1;
- (void)measureMetrics:(id)arg1 automaticallyStartMeasuring:(BOOL)arg2 forBlock:(CDUnknownBlockType)arg3;
- (void)memoryChecker:(id)arg1 didFailWithMessages:(id)arg2 serializedMemoryGraph:(id)arg3;
- (id)nameForLegacyLogging;
- (void)nestedWaiter:(id)arg1 wasInterruptedByTimedOutWaiter:(id)arg2;
- (NSUInteger)numberOfTestIterationsForTestWithSelector:(SEL)arg1;
- (void)performTest:(id)arg1;
- (void)recordFailureWithDescription:(id)arg1 inFile:(id)arg2 atLine:(NSUInteger)arg3 expected:(BOOL)arg4;
- (void)registerDefaultMetrics;
- (void)registerMetricID:(id)arg1 name:(id)arg2 unit:(id)arg3;
- (void)registerMetricID:(id)arg1 name:(id)arg2 unitString:(id)arg3;
- (void)removeUIInterruptionMonitor:(id)arg1;
- (void)reportMeasurements:(id)arg1 forMetricID:(id)arg2 reportFailures:(BOOL)arg3;
- (void)reportMetric:(id)arg1 reportFailures:(BOOL)arg2;
- (void)runActivityNamed:(id)arg1 inScope:(CDUnknownBlockType)arg2;
- (void)setUpTestWithSelector:(SEL)arg1;
- (void)startActivityWithTitle:(id)arg1 block:(CDUnknownBlockType)arg2;
- (void)startActivityWithTitle:(id)arg1 type:(id)arg2 block:(CDUnknownBlockType)arg3;
- (void)startMeasuring;
- (void)stopMeasuring;
- (void)tearDownTestWithSelector:(SEL)arg1;
- (NSUInteger)testCaseCount;
- (Class)testRunClass;
- (void)waitForExpectations:(id)arg1 timeout:(double)arg2;
- (void)waitForExpectations:(id)arg1 timeout:(double)arg2 enforceOrder:(BOOL)arg3;
- (void)waitForExpectationsWithTimeout:(double)arg1 handler:(CDUnknownBlockType)arg2;
- (void)waiter:(id)arg1 didFulfillInvertedExpectation:(id)arg2;
- (void)waiter:(id)arg1 didTimeoutWithUnfulfilledExpectations:(id)arg2;
- (void)waiter:(id)arg1 fulfillmentDidViolateOrderingConstraintsForExpectation:(id)arg2 requiredExpectation:(id)arg3;


@end
