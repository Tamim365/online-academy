import 'package:design_course/AppTheme/appthemeColors.dart';
import 'package:design_course/components/coustom_bottom_nav_bar.dart';
import 'package:design_course/constants.dart';
import 'package:design_course/size_config.dart';
import 'package:flutter/material.dart';
import 'package:design_course/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
