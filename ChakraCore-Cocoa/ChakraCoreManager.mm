//
//  ChakraCoreManager.m
//  ChakraCore-Cocoa
//
//  Created by Qasim Iqbal on 2017-04-24.
//  Copyright © 2017 Qasim Iqbal. All rights reserved.
//

#import "ChakraCoreManager.h"
#import "ChakraCore.h"

@implementation ChakraCoreManager
{
  JsRuntimeHandle runtime;
  JsContextRef context;
  unsigned currentSourceContext;
}

- (instancetype)init
{
  self = [super init];

  if (self)
  {
    JsCreateRuntime(JsRuntimeAttributeNone, nullptr, &runtime);
    JsCreateContext(runtime, &context);

    JsSetCurrentContext(context);
  }

  return self;
}

- (NSString *)executeJavaScriptFromSourcePath:(NSString *)sourcePath
{
  // Create JS string from source URL
  JsValueRef sourceUrl;
  const char *sourceUrlChars = [sourcePath UTF8String];
  JsCreateString(sourceUrlChars, strlen(sourceUrlChars), &sourceUrl);

  // Create JS string from source contents
  JsValueRef scriptSource;
  NSString *sourceString = [[NSString alloc] initWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
  const char *sourceChars = [sourceString UTF8String];
  JsCreateExternalArrayBuffer((void *)sourceChars, (unsigned int)strlen(sourceChars), nullptr, nullptr, &scriptSource);

  // Run source
  JsValueRef result;
  JsRun(scriptSource, currentSourceContext++, sourceUrl, JsParseScriptAttributeNone, &result);

  // Retrieve result as JS string
  JsValueRef resultJSString;
  JsConvertValueToString(result, &resultJSString);

  // Convert JS string to char array
  char *resultChars = nullptr;
  size_t resultCharsLength;
  JsCopyString(resultJSString, nullptr, 0, &resultCharsLength);
  resultChars = (char *)malloc(resultCharsLength + 1);
  JsCopyString(resultJSString, resultChars, resultCharsLength + 1, nullptr);
  resultChars[resultCharsLength] = 0;

  return [NSString stringWithUTF8String:resultChars];
}

@end
