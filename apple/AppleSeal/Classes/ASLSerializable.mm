//
//  ASLSerializable.m
//  AppleSeal
//
//  Created by Mark Mroz on 2020-05-17.
//  Copyright © 2020 Mark Mroz. All rights reserved.
//

#import "ASLSerializable.h"

#include "seal/serializable.h"
#include "seal/galoiskeys.h"

#import "ASLSerializable_Internal.h"
#import "ASLGaloisKeys_Internal.h"

@implementation ASLSerializable {
    seal::Serializable<id> *_serializable;
}

#pragma mark - ASLSerializable_Internal

//-(instancetype)initWithGaloisKey:(seal::Serializable<seal::GaloisKeys>)serializable {
//    _serializable = serializable;
//}

@end
