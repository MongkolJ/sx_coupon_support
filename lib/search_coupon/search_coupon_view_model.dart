import 'package:sx_coupon_support/search_coupon/coupon.dart';
import 'package:sx_coupon_support/search_coupon/search_coupon_services/search_coupon_service_interface.dart';

class SearchCouponViewModel {
  late SearchCouponServiceInterface service;
  Future<Coupon>? fetchedCoupon;

  Future<void> fetchCoupon({required String couponId}) async {
    fetchedCoupon = service.fetchCoupon(couponId: couponId);
  }
}
