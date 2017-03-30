//
//  QYFileManager.m
//  ListSort
//
//  Created by 乔岩 on 2017/3/30.
//  Copyright © 2017年 qiaoyan. All rights reserved.
//

#import "QYFileManager.h"

static NSString *const kPlistFileName = @"QYTitleList.plist";

@implementation QYFileManager

+ (void)saveTitleListWithNewList:(NSArray *)list {
    [list writeToFile:[self titleListFileSandboxPath] atomically:YES];
}

+ (__kindof NSArray *)currentTitleList {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[self titleListFileSandboxPath]]) {
        NSError *error;
        if ([fileManager copyItemAtPath:[self titleListFileBundlePath] toPath:[self titleListFileSandboxPath] error:&error]) {
            NSLog(@"copy success");
        } else {
            NSLog(@"%@",error);
        }
    }
    
    NSArray *currentlist = [NSArray arrayWithContentsOfFile:[self titleListFileSandboxPath]];
    return currentlist;
}

+ (__kindof NSArray *)defaultTitleList {
    NSArray *defaultlist = [NSArray arrayWithContentsOfFile:[self titleListFileBundlePath]];
    return defaultlist;
}

+ (NSString *)titleListFileBundlePath {
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:kPlistFileName];
    return bundlePath;
}

+ (NSString *)titleListFileSandboxPath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *sandboxPath = [pathArray[0] stringByAppendingPathComponent:kPlistFileName];
    return sandboxPath;
}

@end
