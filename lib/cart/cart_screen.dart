import 'package:flutter/material.dart';
import 'package:design_course/model/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      title: Column(
        children: [
          Text(
            "Your Cart",
          ),
          Text(
            "${demoCarts.length} items",
          ),
        ],
      ),
    );
  }
}
