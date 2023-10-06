import 'package:sx_coupon_support/search_coupon/coupon.dart';
import 'package:sx_coupon_support/search_coupon/search_coupon_services/search_coupon_service_interface.dart';

class SearchCouponService implements SearchCouponServiceInterface {
  @override
  Future<Coupon> fetchCoupon({required String couponId}) async {
    return Coupon.defaultValue();
  }
}
