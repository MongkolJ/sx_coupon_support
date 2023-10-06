import 'package:flutter/material.dart';
import 'package:sx_coupon_support/map.dart';
import 'package:sx_coupon_support/search_coupon/search_coupon_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.ad_units)),
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.switch_account_outlined)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SearchCouponView(),
              MapView(),
              SearchCouponView(),
            ],
          ),
        ),
      ),
    );
  }
}
