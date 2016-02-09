//
//  CBApplication+Queries.m
//  xcuitest-server
//

#import "CBApplication+Queries.h"
#import "XCElementSnapshot.h"
#import "XCUIElementQuery.h"
#import "XCAXClient_iOS.h"
#import "XCUIElement.h"
#import "JSONUtils.h"

@implementation CBApplication (Queries)
static NSArray <NSString *> *markedProperties;
static NSArray <NSString *> *identifierProperties;

+ (void)load {
    static dispatch_once_t oncet;
    dispatch_once(&oncet, ^{
        markedProperties = @[@"label", @"title", @"value", @"accessibilityLabel"];
        identifierProperties = @[@"identifier", @"accessibilityIdentifier"];
    });
}

/*
 * Tree
 */

+ (NSDictionary *)tree {
    return [self snapshotTree:[[self currentApplication] lastSnapshot]];
}

+ (NSDictionary *)snapshotTree:(XCElementSnapshot *)snapshot {
    NSMutableDictionary *json = [JSONUtils snapshotToJSON:snapshot];
    
    if (snapshot.children.count) {
        NSMutableArray *children = [NSMutableArray array];
        for (XCElementSnapshot *child in snapshot.children) {
            [children addObject:[self snapshotTree:child]];
        }
        json[@"children"] = children;
    }
    return json;
}

/*
    General Querying
 */

+ (XCUIElement *)elementMarked:(NSString *)mark {
    NSArray *elements = [self elementsMarked:mark];
    return elements.count > 0 ? [elements firstObject] : nil;
}

+ (NSArray <XCUIElement *> *)elementsMarked:(NSString *)text {
    return [self elementsWithAnyOfTheseProperties:markedProperties equalToValue:text];
}

+ (XCUIElement *)elementWithIdentifier:(NSString *)identifier {
    NSArray *elements = [self elementsWithIdentifier:identifier];
    return elements.count > 0 ? [elements firstObject] : nil;
}

+ (NSArray <XCUIElement *> *)elementsWithIdentifier:(NSString *)identifier {
    return [[[[self currentApplication] descendantsMatchingType:XCUIElementTypeAny]
            matchingIdentifier:identifier] allElementsBoundByIndex];
}

+ (NSArray <XCUIElement *> *)elementsWithType:(NSString *)typeString {
    XCUIElementType type = [JSONUtils elementTypeForString:typeString];
    if ((int)type == -1) {
        @throw [[NSException alloc] initWithName:@"Invalid Element Type"
                                          reason:[NSString stringWithFormat:@"Invalid element type: %@", typeString]
                                        userInfo:nil];
    }
    XCUIElementQuery *query = [[self currentApplication] descendantsMatchingType:type];
    return [query allElementsBoundByIndex];
}

+ (NSArray <XCUIElement *> *)elementsWithAnyOfTheseProperties:(NSArray *)properties
                                                 equalToValue:(NSString *)value {
    NSMutableString *predString = [NSMutableString string];
    for (NSString *prop in properties) {
        [predString appendFormat:@"%@ == '%@'", prop, value];
        if (prop != [properties lastObject]) {
            [predString appendString:@" OR "];
        }
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predString];
    XCUIElementQuery *query = [[[self currentApplication] descendantsMatchingType:XCUIElementTypeAny]
                               matchingPredicate:predicate];
    
    return [query allElementsBoundByIndex];
}

+ (NSArray <NSDictionary *> *)jsonForElementsWithAnyOfTheseProperties:(NSArray *)properties
                                                         equalToValue:(NSString *)value {
    NSArray *childElements = [self elementsWithAnyOfTheseProperties:properties
                                                       equalToValue:value];
    NSMutableArray *ret = [NSMutableArray array];
    
    //TODO: Should we check the application itself?
    for (XCUIElement *element in childElements) {
        [ret addObject:[JSONUtils elementToJSON:element]];
    }
    return ret;
}

+ (NSArray <NSDictionary *> *)jsonForElementsMarked:(NSString *)text {
    return [self jsonForElementsWithAnyOfTheseProperties:markedProperties
                                            equalToValue:text];
}

+ (NSArray <NSDictionary *> *)jsonForElementsWithID:(NSString *)identifier {
    NSArray *elements = [self elementsWithIdentifier:identifier];
    NSMutableArray *ret = [NSMutableArray array];
    
    //TODO: Should we check the application itself?
    for (XCUIElement *element in elements) {
        [ret addObject:[JSONUtils elementToJSON:element]];
    }
    return ret;
}

+ (NSArray <NSDictionary *> *)jsonForElementsWithType:(NSString *)type {
    NSArray *elements = [self elementsWithType:type];
    NSMutableArray *ret = [NSMutableArray array];
    
    //TODO: Should we check the application itself?
    for (XCUIElement *element in elements) {
        [ret addObject:[JSONUtils elementToJSON:element]];
    }
    return ret;
}
@end
