//
//  ASLSerializable_Internal.h
//  AppleSeal
//
//  Created by Mark Mroz on 2020-05-17.
//  Copyright © 2020 Mark Mroz. All rights reserved.
//

#import "ASLSerializable.h"

#include "seal/serializable.h"
#include "seal/galoiskeys.h"
#include "seal/relinkeys.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASLSerializable ()

-(instancetype)initWithGaloisKey:(seal::Serializable<seal::GaloisKeys>)serializable;

-(instancetype)initWithRelinearizationKeys:(seal::Serializable<seal::RelinKeys>)serializable;

@end

NS_ASSUME_NONNULL_END
