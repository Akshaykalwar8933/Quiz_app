import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../codeEditor/code_editor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../aboutPage/mainPage.dart';
import '../../constants/constantString.dart';
import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/profileSection/getProfileInfo.dart';
import '../../reusableWidgets/profileSection/mainPage.dart';
import '../../reusableWidgets/profileSection/provider.dart';
import '../checkScores/checkScores.dart';
import '../quizOfEachTeacher/code_editor.dart';

ListTile listTileMyQuiz(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 20),
    leading:
        const Icon(FontAwesomeIcons.receipt, size: 20, color: Colors.black),
    title: Text(
      "Code Editor",
      style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CodeEditor()));
    },
  );
}

ListTile listTileCheckScore(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: Icon(FontAwesomeIcons.squarePollVertical,
        size: setSize(context, 17), color: Colors.black),
    title: Text(
      "Check My Score",
      style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CheckScore()));
    },
  );
}

Container listTileProfile(context) {
  return Container(
    child: Consumer<ProfilePageProvider>(
      builder: (context, providervalue, child) {
        return ListTile(
          contentPadding: const EdgeInsets.only(top: 15, left: 20),
          leading: const Icon(FontAwesomeIcons.userPen,
              size: 20, color: Colors.black),
          title: Text(
            "My Profile",
            style: TextStyle(
                fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
          ),
          onTap: () {
            getProfileInfo(providervalue);
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
        );
      },
    ),
  );
}

ListTile listTileShare(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.shareNodes, size: 20, color: Colors.black),
    title: Text(
      "Share",
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Share.share('com.example.flutter_project');
    },
  );
}
