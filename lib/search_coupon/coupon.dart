typedef CouponType = int;

class Coupon {
  late String id;
  late CouponType type;
  late bool isChangeable;
  late double value;
  late double actualRedeem;
  late bool isRedeemed;

  String? transactionId;
  String? saleOrderId;
  String? shopName;
  String? shopId;
  String? sxId;
  String? tel;
  String? useDate;

  Coupon.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    type = json['type'];
    isChangeable = json['isChangeable'];
    value = json['value'];
    actualRedeem = json['remainValue'];
    isRedeemed = json['isRedeemed'];

    transactionId = json['transactionId'];
    saleOrderId = json['saleOrderId'];
    shopName = json['shopName'];
    shopId = json['shopId'];
    sxId = json['sxId'];
    tel = json['tel'];
    useDate = json['useDate'];
  }

  Coupon.defaultValue() {
    id = '-';
    type = 0;
    isChangeable = false;
    value = 0;
    actualRedeem = 0;
    isRedeemed = false;

    transactionId = null;
    saleOrderId = null;
    shopName = null;
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
