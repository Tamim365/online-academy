import 'package:flutter/widgets.dart';

import 'package:design_course/complete_profile/complete_profile_screen.dart';
import 'package:design_course/forgot_password/forgot_password_screen.dart';
import 'package:design_course/HomeScreen/homeUi.dart';
import 'package:design_course/login_success/login_success_screen.dart';
import 'package:design_course/otp/otp_screen.dart';
import 'package:design_course/sign_in/sign_in_screen.dart';
import 'package:design_course/splash/splash_screen.dart';
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
};
