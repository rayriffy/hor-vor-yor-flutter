import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horvoryor/Result.dart';
import 'package:niku/niku.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

import 'package:dio/dio.dart';

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

  bool _inProgress = false;
  bool _hasError = false;
  String _errorMessage = '';

  void onPress () async {
    if (_inProgress == true) {
      return;
    }

    // reset state
    setState(() {
      _inProgress = true;
      _hasError = false;
      _errorMessage = '';
    });

    try {
      var response = await Dio().post(
        'https://horvoryor.api.rayriffy.com/api/check',
        options: Options(
          method: 'POST'
        ),
        data: {
          'lotteryNumber': controller.text
        }
      );

      LotteryResult lotteryResult = LotteryResult.fromJson(response.data);

      setState(() {
        _inProgress = false;
        _hasError = false;
      });

      // func
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Result(lotteryResult: lotteryResult))
      );
    } on DioError catch (error) {
      try {
        if (error.response.data['data']['message'] == 'invalid-input') {
          setState(() {
            _errorMessage = 'กรุณากรอกเพียงตัวเลขสลากกินแบ่ง 6 หลักเท่านั้น';
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'ไม่สามารถตรวจผลสลากกินแบ่งได้ในตอนนี้';
        });
      } finally {
        setState(() {
          _hasError = true;
        });
      }
    } finally {
      setState(() {
        _inProgress = false;
      });
    }
  }

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
          .enabled(!_inProgress)
          .outlined(borderRadius: BorderRadius.circular(6.0))
          .shadows([
            Shadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              color: Colors.black.withOpacity(.1),
            )
          ])
          .mt(18)
          .mx(36),
        _hasError ? NikuText(_errorMessage).color(TWColors.red.shade500).mt(12) : Niku(),
        NikuButton(
          NikuText(_inProgress ? 'จะได้หรือจะโดนกิน???' : 'ตรวจผลเลย!')
            .fontSize(14)
            .fontFamily('Niramit')
            .fontSize(14)
            .color(Colors.white)
        )
          .onPressed(onPress)
          .bg(_inProgress ? TWColors.blue.shade600 : TWColors.blue.shade700)
          .px(22)
          .py(10)
          .niku()
          .mt(12),
      ]).mainCenter().mainStart().niku().pt(120)
    ).niku().on(tap: () {
      focusNode.unfocus();
    });
  }
}
