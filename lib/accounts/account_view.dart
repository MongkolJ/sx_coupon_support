import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:sx_coupon_support/accounts/accounts.dart';

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();
}

class _AccountsViewState extends State<AccountsView> {
  String shopId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BarcodeWidget(
                data: passwords[shopId] ?? '',
                barcode: Barcode.code128(),
                errorBuilder: (context, error) => const Center(
                  child: Center(
                    child: Text(
                      'ไม่พบร้านค้า',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'กรุณาระบุหมายเลขร้าน',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                ),
                onChanged: (value) {
                  shopId = value.toUpperCase();
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
