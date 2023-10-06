import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:sx_coupon_support/search_coupon/coupon.dart';
import 'package:sx_coupon_support/search_coupon/search_coupon_view_model.dart';

class SearchCouponView extends StatefulWidget {
  const SearchCouponView({super.key});

  @override
  State<SearchCouponView> createState() => _SearchCouponViewState();
}

class _SearchCouponViewState extends State<SearchCouponView> {
  final TextEditingController _controller = TextEditingController();
  final SearchCouponViewModel _viewModel = SearchCouponViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _coupon(),
              _buffer(),
              _searchRow(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _coupon() {
    return Expanded(
      child: FutureBuilder<Coupon>(
        future: _viewModel.fetchedCoupon,
        builder: (
          BuildContext context,
          AsyncSnapshot<Coupon> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text(
                'กรุณาระบุหมายเลขคูปอง',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator(
              color: Colors.grey,
            );
          }

          Coupon coupon = Coupon.defaultValue();

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'ไม่พบหมายเลขคูปองที่ระบุในระบบ',
              ),
            );
          }

          if (snapshot.hasData) {
            coupon = snapshot.data!;
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _couponDetails(
                    title: 'Coupon ID',
                    value: coupon.id,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  _couponDetails(
                    title: 'Coupon Type',
                    value: coupon.type == 0 ? 'กระดาษ' : 'ดิจิตอล',
                  ),
                  _couponDetails(
                    title: 'ทอนได้?',
                    value: coupon.isChangeable ? 'ทอนได้' : 'ทอนไม่ได้',
                  ),
                  _couponDetails(
                    title: 'มูลค่าคูปอง',
                    value: coupon.value.toStringAsFixed(2),
                  ),
                  _couponDetails(
                    title: 'Actual',
                    value: coupon.actualRedeem.toStringAsFixed(2),
                  ),
                  _couponDetails(
                    title: 'มีการ Redeem รึยัง?',
                    value: coupon.isRedeemed ? 'Redeemed' : 'ยังไม่ Redeem',
                    textColor: coupon.isRedeemed ? Colors.red : Colors.green,
                  ),
                  _couponDetails(
                    title: 'Transaction Id',
                    value: coupon.transactionId ?? 'ยังไม่มีการ Redeem',
                  ),
                  _couponDetails(
                    title: 'Sale Order Id',
                    value: coupon.saleOrderId ?? 'ยังไม่มีการนำไปชำระเงิน',
                  ),
                  _couponDetails(
                    title: 'ใช้ที่ร้าน',
                    value: '${coupon.shopId ?? ''} - ${coupon.shopName ?? ''}',
                  ),
                  _couponDetails(
                    title: 'SX Id ของลูกค้า',
                    value: coupon.sxId ?? 'ไม่มีการสะสมแต้ม',
                  ),
                  _couponDetails(
                    title: 'เบอร์โทรของลูกค้า',
                    value: coupon.tel ?? 'ไม่มีการสะสมแต้ม',
                  ),
                  _couponDetails(
                    title: 'ใช้เมื่อ',
                    value: coupon.useDate ?? 'ยังไม่มีการใช้งาน',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _couponDetails({
    required String title,
    required String value,
    Color textColor = Colors.black,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title:',
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        _buffer(),
      ],
    );
  }

  SizedBox _searchRow() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'กรุณาระบุ หรือ แสกนคูปอง',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
              onEditingComplete: () async {
                _viewModel.fetchCoupon(couponId: _controller.text);
                setState(() {});
              },
            ),
          ),
          _buffer(),
          SizedBox(
            height: 60,
            width: 60,
            child: IconButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    _controller.text = res;
                    _viewModel.fetchCoupon(couponId: _controller.text);
                  }
                });
              },
              icon: const Icon(
                Icons.qr_code,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buffer() {
    return const SizedBox(
      width: 8,
      height: 8,
    );
  }
}
