import 'package:flutter/material.dart';

import 'components/body.dart';

class PaymentSuccessScreen extends StatelessWidget {
  static String routeName = "/payment_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Payment Success!"),
      ),
      body: Body(),
    );
  }
}
