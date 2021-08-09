import 'package:design_course/cart/cart_screen.dart';
import 'package:design_course/live_stream/liveCourseListView.dart';
import 'package:design_course/payment/paymentScreen.dart';
import 'package:design_course/payment_success/payment_success_screen.dart';
import 'package:design_course/profile/profile_screen.dart';
import 'package:flutter/widgets.dart';

import 'package:design_course/complete_profile/complete_profile_screen.dart';
import 'package:design_course/forgot_password/forgot_password_screen.dart';
import 'package:design_course/HomeScreen/homeUi.dart';
import 'package:design_course/login_success/login_success_screen.dart';
import 'package:design_course/otp/otp_screen.dart';
import 'package:design_course/sign_in/sign_in_screen.dart';
import 'package:design_course/splash/splash_screen.dart';
import 'live_stream/liveStreamScreen.dart';
import 'sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeUi.routeName: (context) => HomeUi(),
  LiveStreamScreen.routeName: (context) => LiveStreamScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
  PaymentSuccessScreen.routeName: (context) => PaymentSuccessScreen(),
};
