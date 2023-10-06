import 'package:sx_coupon_support/search_coupon/coupon.dart';

abstract class SearchCouponServiceInterface {
  Future<Coupon> fetchCoupon({required String couponId});
}
