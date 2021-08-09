import 'dart:ui';
import 'package:design_course/Model/liveCourses.dart';
import 'package:design_course/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'liveCourseListView.dart';

class LiveStreamScreen extends StatefulWidget {
  static String routeName = "/liveCourse";
  @override
  _LiveStreamScreenState createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<LiveListData> courseList = LiveListData.courseList;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 130, left: 0, right: 0, bottom: 0),
      // color: Colors.orange,
      child: Scaffold(
        appBar: AppBar(
            shadowColor: Colors.transparent,
            toolbarHeight: 150,
            leading: BackButton(color: Colors.black), // here the desired height
            flexibleSpace: Container(
              color: Colors.blue,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.live_tv,
                            size: 20,
                          ),
                        ),
                        TextSpan(
                          text: " Join Live Streams",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "muli",
                            fontSize: 20,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  getSearchBar(),
                ],
              ),
            )),
        body: Container(
          color: Colors.blue,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: ListView.builder(
              itemCount: courseList.length,
              padding: const EdgeInsets.only(top: 8),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final int count =
                    courseList.length > 10 ? 10 : courseList.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController.forward();
                return LiveCourseList(
                  callback: () {},
                  liveCourseData: courseList[index],
                  animation: animation,
                  animationController: animationController,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Widget getListUI() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       // color: HotelAppTheme.buildLightTheme().backgroundColor,
  //       boxShadow: <BoxShadow>[
  //         BoxShadow(
  //             color: Colors.grey.withOpacity(0.2),
  //             offset: const Offset(0, -2),
  //             blurRadius: 8.0),
  //       ],
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           height: MediaQuery.of(context).size.height - 156 - 50,
  //           child: FutureBuilder<bool>(
  //             future: getData(),
  //             builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
  //               if (!snapshot.hasData) {
  //                 return const SizedBox();
  //               } else {
  //                 return ListView.builder(
  //                   itemCount: courseList.length,
  //                   scrollDirection: Axis.vertical,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     final int count =
  //                         courseList.length > 10 ? 10 : courseList.length;
  //                     final Animation<double> animation =
  //                         Tween<double>(begin: 0.0, end: 1.0).animate(
  //                             CurvedAnimation(
  //                                 parent: animationController,
  //                                 curve: Interval((1 / count) * index, 1.0,
  //                                     curve: Curves.fastOutSlowIn)));
  //                     animationController?.forward();

  //                     return LiveCourseList(
  //                       callback: () {},
  //                       liveCourseData: courseList[index],
  //                       animation: animation,
  //                       animationController: animationController,
  //                     );
  //                   },
  //                 );
  //               }
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget getHotelViewList() {
  //   final List<Widget> courseListViews = <Widget>[];
  //   for (int i = 0; i < courseList.length; i++) {
  //     final int count = courseList.length;
  //     final Animation<double> animation =
  //         Tween<double>(begin: 0.0, end: 1.0).animate(
  //       CurvedAnimation(
  //         parent: animationController,
  //         curve: Interval((1 / count) * i, 1.0, curve: Curves.fastOutSlowIn),
  //       ),
  //     );
  //     courseListViews.add(
  //       LiveCourseList(
  //         callback: () {},
  //         liveCourseData: courseList[i],
  //         animation: animation,
  //         animationController: animationController,
  //       ),
  //     );
  //   }
  //   animationController?.forward();
  //   return Column(
  //     children: courseListViews,
  //   );
  // }

  Widget getSearchBar() {
    return Padding(
      padding: EdgeInsets.only(top: 3, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Container(
                          child: TextField(
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            // textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'muli',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
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
                        color: Colors.grey.withOpacity(0.4),
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
}
