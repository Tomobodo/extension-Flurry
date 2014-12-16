#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Flurry.h"

#include <Utils.h>


namespace openflurry {

	void init(const char* apiKey, bool verbose){
		NSString* apiKeyStr = [[NSString alloc] initWithUTF8String:apiKey];
		[Flurry startSession:apiKeyStr];
	}

	void logEvent(const char * eventName, const char * keys, const char * values, bool isTimed){
		NSString * eventNameStr = [[NSString alloc] initWithUTF8String:eventName];
		NSString * keysStr =  [[NSString alloc] initWithUTF8String:keys];
		NSString * valuesStr =  [[NSString alloc] initWithUTF8String:values];

		NSArray * keysAr = [keysStr componentsSeparatedByString:@";"];
		NSArray * valsAr = [valuesStr componentsSeparatedByString:@";"];
		
		if([keysAr count] > 0){
			NSMutableDictionary * dictionary = [[NSMutableDictionary alloc] init];
			for(int i = 0; i < [keysAr count]; ++i)
				[dictionary setObject:[valsAr objectAtIndex:i] forKey:[keysAr objectAtIndex:i]];
			[Flurry logEvent:eventNameStr withParameters:dictionary timed:isTimed];
		}else{
			[Flurry logEvent:eventNameStr timed:isTimed];
		}
	}

	void endTimedEvent(const char * eventName, const char * keys, const char * values){
		NSString * eventNameStr = [[NSString alloc] initWithUTF8String:eventName];
		NSString * keysStr =  [[NSString alloc] initWithUTF8String:keys];
		NSString * valuesStr =  [[NSString alloc] initWithUTF8String:values];
		
		NSArray * keysAr = [keysStr componentsSeparatedByString:@";"];
		NSArray * valsAr = [valuesStr componentsSeparatedByString:@";"];

		if([keysAr count] > 0){
			NSMutableDictionary * dictionary = [[NSMutableDictionary alloc] init];
			for(int i = 0; i < [keysAr count]; ++i)
				[dictionary setObject:[valsAr objectAtIndex:i] forKey:[keysAr objectAtIndex:i]];
			[Flurry endTimedEvent:eventNameStr withParameters:dictionary];
		}else{
			[Flurry logEvent:eventNameStr withParameters:nil];
		}
	}

	void onPageView(){
		[Flurry logPageView];
	}

}