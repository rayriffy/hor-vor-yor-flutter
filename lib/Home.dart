import 'package:flutter/material.dart';
import 'package:horvoryor/Result.dart';
import 'package:niku/niku.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

import 'package:http/http.dart' as http;

import 'LotteryResult.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ห.ว.ย.',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  PageWithState createState() => PageWithState();
}

class PageWithState extends State<Page> {
  // create controller for text input
  final controller = TextEditingController();
  FocusNode focusNode;

  // init focus on mount
  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
  }

  // clean when removed
  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NikuColumn([
        NikuText('ห.ว.ย.').fontSize(60).fontFamily('Prompt').fontWeight(FontWeight.w600),
        NikuText('ใส่เลขสลากกินแบ่งเพื่อดูผลเลย').fontSize(16).fontFamily('Niramit'),
        NikuTextField("")
          .textEditingController(controller)
          .focusNode(focusNode)
          .outlined(borderRadius: BorderRadius.circular(6.0))
          .shadows([
            Shadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              color: Colors.black.withOpacity(.1),
            )
          ])
          .my(18)
          .mx(36),
        NikuButton(NikuText('ตรวจแล้วรวย!').color(Colors.white)).bg(TWColors.blue.shade600).px(24).py(16).onPressed(() {
          // func
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Result(lotteryResult: LotteryResult('123', '123', '123')))
          );
        }),
      ]).mainCenter().mainStart().niku().pt(120)
    ).niku().on(tap: () {
      focusNode.unfocus();
    });
  }
}
