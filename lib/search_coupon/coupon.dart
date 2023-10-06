typedef CouponType = int;

class Coupon {
  late String id;
  late CouponType type;
  late bool isChangeable;
  late double value;
  late double remainValue;
  late bool isRedeemed;
  late bool isUsed;

  String? transactionId;
  String? saleOrderId;
  String? shopName;
  String? shopId;
  String? sxId;
  String? useDate;

  Coupon.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    type = json['type'];
    isChangeable = json['isChangeable'];
    value = json['value'];
    remainValue = json['remainValue'];
    isRedeemed = json['isRedeemed'];
    isUsed = json['isUsed'];

    transactionId = json['transactionId'];
    saleOrderId = json['saleOrderId'];
    shopName = json['shopName'];
    shopId = json['shopId'];
    sxId = json['sxId'];
    useDate = json['useDate'];
  }

  Coupon.defaultValue() {
    id = '-';
    type = 0;
    isChangeable = false;
    value = 0;
    remainValue = 0;
    isRedeemed = false;
    isUsed = false;

    transactionId = '-';
    saleOrderId = '-';
    shopName = '-';
    shopId = '-';
    sxId = '-';
    useDate = '-';
  }
}

abstract class CouponTypes {
  static const CouponType paper = 0;
  static const CouponType digital = 1;
}
