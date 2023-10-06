import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:sx_coupon_support/search_coupon/coupon.dart';
import 'package:sx_coupon_support/search_coupon/search_coupon_services/search_coupon_service_interface.dart';

class SearchCouponService implements SearchCouponServiceInterface {
  @override
  Future<Coupon> fetchCoupon({required String couponId}) async {
    //10080635572

    try {
      Response response = await get(
        Uri.parse(
          'https://possx-uat.thaibevapp.com/sale/api/v1/Coupon/GetCouponInfo?couponCode=$couponId',
        ),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
      ).timeout(
        const Duration(seconds: 30),
      );

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return Coupon.fromJson(
          json: jsonDecode(response.body),
          couponId: couponId,
        );
      }

      throw Exception();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
