typedef CouponType = int;

class Coupon {
  late String id;
  late String type;
  late String isChangeable;
  late double value;
  late double actualRedeem;
  late bool isRedeemed;

  String? transactionId;
  String? saleOrderId;
  String? shopId;
  String? sxId;
  String? tel;
  String? useDate;

  Coupon.fromJson({
    required Map<String, dynamic> json,
    required String couponId,
  }) {
    id = couponId;
    type = json['couponType'];
    isChangeable = json['changeType'];
    value = json['value'] * 1.0;
    actualRedeem = json['actual'] * 1.0;
    isRedeemed = json['isRedeem'] == 1;

    transactionId = json['transactionId'];
    saleOrderId = json['saleOrderId'];
    shopId = json['usedBy'];
    sxId = json['sxId'];
    tel = json['phone'];
    useDate = json['usedDate'];
  }

  Coupon.defaultValue() {
    id = '-';
    type = '';
    isChangeable = '';
    value = 0;
    actualRedeem = 0;
    isRedeemed = false;

    transactionId = null;
    saleOrderId = null;
    shopId = null;
    sxId = null;
    tel = null;
    useDate = null;
  }
}

abstract class CouponTypes {
  static const CouponType paper = 0;
  static const CouponType digital = 1;
}
