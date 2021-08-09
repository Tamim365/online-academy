import 'package:flutter/material.dart';
import 'package:design_course/components/default_button.dart';
import 'package:design_course/HomeScreen/homeUi.dart';
import 'package:design_course/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: MediaQuery.of(context).size.height * 0.4, //40%
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        Text(
          "Payment Successful",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: DefaultButton(
            text: "Go To Course",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeUi()));
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
