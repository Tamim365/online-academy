import 'package:design_course/AppTheme/appthemeColors.dart';
import 'package:design_course/HomeScreen/ButtonDesign/bouncyButton.dart';
import 'package:design_course/HomeScreen/categoryListView.dart';
import 'package:design_course/HomeScreen/popularListView.dart';
import 'package:design_course/MyClippers/clipPath.dart';
import 'package:design_course/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:design_course/sizeConfig.dart';

class HomeUi extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig().init(constraints, orientation);
            return Scaffold(
              backgroundColor: AppThemeColors.bgColor,
              body: HomeScreen(),
            );
          },
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            expandedHeight: 35 * SizeConfig.heightMultiplier,
            flexibleSpace:
                FlexibleSpaceBar(background: getFlexibleSpaceAppBar())),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    getCategoryList(),
                    SizedBox(
                      height: 4.45 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                      width: double.infinity,
                      color: AppThemeColors.bgColor,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 18,
                          top: 10,
                          bottom: 2.06 * SizeConfig.heightMultiplier,
                        ),
                        child: Text("Popular Course",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: "muli",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                fontSize: 2.8 * SizeConfig.textMultiplier,
                                color: AppThemeColors.pureBlack)),
                      ),
                    ),
                    PopularListView(),
                  ],
                )),
          ]),
        )
      ],
    );
  }

  Widget getFlexibleSpaceAppBar() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: MyClippers(),
                child: Container(
                  height: 35 * SizeConfig.heightMultiplier,
                  width: MediaQuery.of(context).size.width,
                  color: AppThemeColors.darkBlue,
                ),
              ),
              Positioned(
                bottom: 40,
                right: 0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 12 * SizeConfig.imageSizeMultiplier,
                      width: 12 * SizeConfig.imageSizeMultiplier,
                      child: Image.asset("assets/nature.png"),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  getAppBar(),
                  // getSearchBar(),

                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hello, XXXX!",
                        style: TextStyle(
                          fontFamily: "Muli",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Search for subject you want to learn",
                        style: TextStyle(
                          fontFamily: "Muli",
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 2,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),

                  getLiveStreamBar(),
                  // getCategoryList(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getCategoryList() {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 18, top: MediaQuery.of(context).viewPadding.top),
              child: Text(
                "Category",
                style: TextStyle(
                    fontFamily: "muli",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 2.8 * SizeConfig.textMultiplier,
                    color: AppThemeColors.pureBlack),
              ),
            ),
            SizedBox(
              height: 2.06 * SizeConfig.heightMultiplier,
            ),
            BouncyButton(),
            SizedBox(
              height: 2.06 * SizeConfig.heightMultiplier,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "See All >>",
                style: TextStyle(
                    fontFamily: "muli",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    fontSize: 2.0 * SizeConfig.textMultiplier,
                    color: Colors.deepOrangeAccent),
              ),
            ),
            SizedBox(
              height: 6.45 * SizeConfig.heightMultiplier,
            ),
            CategoryListView(),
          ]),
    );
  }

  Widget getLiveStreamBar() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.topLeft,
        child: TextButton.icon(
          label: Text(
            "Join a Live Stream",
            style: TextStyle(
              fontFamily: "Muli",
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          icon: Icon(
            Icons.live_tv,
            size: 20,
            color: Colors.white,
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.fromLTRB(
                      15 * SizeConfig.widthMultiplier,
                      2 * SizeConfig.heightMultiplier,
                      30 * SizeConfig.widthMultiplier,
                      2 * SizeConfig.heightMultiplier)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ))),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget getSearchBar() {
    return Padding(
      padding: EdgeInsets.only(top: 3 * SizeConfig.heightMultiplier, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 73 * SizeConfig.widthMultiplier,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: AppThemeColors.nearlyWhite,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Container(
                          child: TextField(
                            cursorColor: AppThemeColors.darkBlue,
                            keyboardType: TextInputType.text,
                            // textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'muli',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppThemeColors.pureBlack),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Search Here",
                                hintStyle: TextStyle(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      child: Icon(
                        Icons.search,
                        color: AppThemeColors.darkGrey.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Padding(
        padding: EdgeInsets.only(
            top: 2 * SizeConfig.heightMultiplier, left: 18, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.orange,
                  size: 40,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.8),
                    shape: BoxShape.circle),
                height: 15 * SizeConfig.imageSizeMultiplier,
                width: 15 * SizeConfig.imageSizeMultiplier,
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.search,
                    color: AppThemeColors.nearlyWhite,
                    size: 30,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

enum CategoryType { ui, markeitng, security, coding }
