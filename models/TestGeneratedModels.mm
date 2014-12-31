//
//  TestGeneratedModels.mm
//  See the file "LICENSE.md" for the full license governing this code.
//


#if TEST_GENERATED_MODELS

#import "TestGeneratedModels.h"

// vert seg mlp models
#import "modelm_befe75da.hpp"

// conv models
#include "modelc_5c241121.hpp"
#include "modelc_01266c1b.hpp"
#include "modelc_b00bf70c.hpp"

// expiry models
#include "modelm_730c4cbd.hpp"
#include "modelc_ab0b6054.hpp"
#include "modelc_d3fc216e.hpp"
#include "modelc_918daa9c.hpp"

@implementation TestGeneratedModels

static BOOL failure = NO;

#define SELF_CHECK_MODEL(model_fn_name) if (model_fn_name()) { \
                                          printf("Model %s passes self-check.\n", #model_fn_name); \
                                        } \
                                        else { \
                                          printf("Model %s fails self-check.\n", #model_fn_name); \
                                          failure = YES; \
                                        }

+ (void)testVSegMlpCategorization {
  SELF_CHECK_MODEL(passm_befe75da);
}

+ (void)testConvCategorization {
  SELF_CHECK_MODEL(passc_5c241121);
  SELF_CHECK_MODEL(passc_01266c1b);
  SELF_CHECK_MODEL(passc_b00bf70c);
}

+ (void)testExpiryModels {
#if SCAN_EXPIRY
  SELF_CHECK_MODEL(passm_730c4cbd);
  SELF_CHECK_MODEL(passc_ab0b6054);
  SELF_CHECK_MODEL(passc_d3fc216e);
  SELF_CHECK_MODEL(passc_918daa9c);
#endif
}

+ (void)selfCheck {
  [self testVSegMlpCategorization];
  [self testConvCategorization];
  [self testExpiryModels];
  NSAssert(!failure, @"One or more models failed self-check.");
}

@end

#endif