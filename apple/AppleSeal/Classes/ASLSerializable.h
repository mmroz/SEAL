//
//  ASLSerializable.h
//  AppleSeal
//
//  Created by Mark Mroz on 2020-05-17.
//  Copyright © 2020 Mark Mroz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASLSerializable<T> : NSObject
    @property (nonatomic, readonly) T object;
@end

NS_ASSUME_NONNULL_END
