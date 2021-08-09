import 'package:design_course/components/coustom_bottom_nav_bar.dart';
import 'package:design_course/components/default_button.dart';
import 'package:design_course/enums.dart';
import 'package:design_course/payment/card_back.dart';
import 'package:design_course/payment/card_front.dart';
import 'package:design_course/payment_success/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PaymentScreen extends StatefulWidget {
  static String routeName = "/payment";
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  double _rotationFactor = 0;
  TextEditingController _cardNumberController, _cvvController;
  AnimationController _flipAnimationController;
  Animation<double> _flipAnimation;
  FocusNode _cvvFocus;

  String _cardNumber = '';
  String _cvvNumber = '';

  _PaymentScreenState() {
    _cardNumberController = TextEditingController();
    _cvvController = TextEditingController();
    _cvvFocus = FocusNode();

    _cardNumberController.addListener(() {
      _cardNumber = _cardNumberController.text;
      setState(() {});
    });

    _cvvController.addListener(() {
      _cvvNumber = _cvvController.text;
      setState(() {});
    });

    _cvvFocus.addListener(() {
      _cvvFocus.hasFocus
          ? _flipAnimationController.forward()
          : _flipAnimationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();

    _flipAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));

    _flipAnimation =
        Tween<double>(begin: 0, end: 1).animate(_flipAnimationController)
          ..addListener(() {
            setState(() {});
          });

    _flipAnimationController.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cards'),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(pi * _flipAnimation.value),
                origin: Offset(MediaQuery.of(context).size.width / 2, 0),
                child: _flipAnimation.value < 0.5
                    ? CardFrontView(cardNumber: _cardNumber)
                    : CardBackView(cvvNumber: _cvvNumber)),
            // Slider(
            //   onChanged: (double value){
            //     setState(() {
            //       _rotationFactor = value;
            //     });
            //   },
            //   value: _rotationFactor
            // )
            Container(
              padding: EdgeInsets.all(16),
              child: Column(children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Card Number'),
                  controller: _cardNumberController,
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(hintText: 'Name on Card'),
                ),
                SizedBox(height: 5),
                Row(children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Expiry'),
                      )),
                  SizedBox(width: 32),
                  Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(hintText: 'CVV'),
                        controller: _cvvController,
                        focusNode: _cvvFocus,
                      )),
                ])
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DefaultButton(
                text: "Make Payment",
                press: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 300),
                        transitionsBuilder:
                            (context, animation, animationTime, child) {
                          return ScaleTransition(
                            scale: animation,
                            alignment: Alignment.bottomCenter,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, animationTime) {
                          return PaymentSuccessScreen();
                        },
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
