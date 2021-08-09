import 'package:design_course/AppTheme/appthemeColors.dart';
import 'package:flutter/material.dart';
import 'paymentScreen.dart';

class CardFrontView extends StatelessWidget {
  final String cardNumber;

  CardFrontView({Key key, this.cardNumber}) : super(key: key) {
    _formattedCardNumber = this.cardNumber.padRight(16, '*');
    _formattedCardNumber = _formattedCardNumber.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)}");
  }

  String _formattedCardNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Color.fromRGBO(0, 30, 108, 1),
        margin: EdgeInsets.all(16),
        elevation: 8,
        child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/images/visa.png",
                    height: 70,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  _formattedCardNumber,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(2, 1))
                      ]),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Card Holder'),
                        Text(
                          'Mr. XYZ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Expiry'),
                        Text(
                          '10/24',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
