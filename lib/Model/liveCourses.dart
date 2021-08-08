class LiveListData {
  LiveListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.viewers = 80,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  int viewers;

  static List<LiveListData> courseList = <LiveListData>[
    LiveListData(
      imagePath: 'assets/images/live_1.png',
      titleTxt: 'App Development',
      subTxt: 'Introduction of app dev',
      viewers: 80,
    ),
    LiveListData(
      imagePath: 'assets/images/live_2.png',
      titleTxt: 'Web Development',
      subTxt: 'Introduction of web dev',
      viewers: 74,
    ),
    LiveListData(
      imagePath: 'assets/images/live_1.png',
      titleTxt: 'App Development',
      subTxt: 'Introduction of app dev',
      viewers: 62,
    ),
    LiveListData(
      imagePath: 'assets/images/live_2.png',
      titleTxt: 'Web Development',
      subTxt: 'Introduction of web dev',
      viewers: 90,
    ),
    LiveListData(
      imagePath: 'assets/images/live_1.png',
      titleTxt: 'App Development',
      subTxt: 'Introduction of app dev',
      viewers: 240,
    ),
  ];
}
