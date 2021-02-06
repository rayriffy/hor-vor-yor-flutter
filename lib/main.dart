import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
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
  final textInputController = TextEditingController();
  FocusNode textInputFocus;

  // init focus on mount
  @override
  void initState() {
    super.initState();

    textInputFocus = FocusNode();
  }

  // clean when removed
  @override
  void dispose() {
    textInputController.dispose();
    textInputFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          textInputFocus.unfocus();
        },
        child: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 160),
                  child: Column(children: [
                    // title
                    Text('ห.ว.ย.',
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.w600)),
                    // subtitle
                    Text('ข้อมูลสลากกินแบ่งวันที่ 31 กุมภาพันธ์ 2564',
                        style: TextStyle(fontSize: 16, fontFamily: 'Niramit')),
                    // number input
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 24, horizontal: 36),
                        child: Material(
                            elevation: 20,
                            borderRadius: BorderRadius.circular(6.0),
                            shadowColor: Color.fromRGBO(0, 0, 0, 0.05),
                            child: TextField(
                                focusNode: textInputFocus,
                                controller: textInputController,
                                keyboardType: TextInputType.number,
                                style: new TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusColor: TWColors.blue.shade500,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: TWColors.gray.shade200)),
                                )))),
                    // result
                    Padding(
                        padding: EdgeInsets.only(top: 16, left: 36, right: 36),
                        child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(8.0),
                            shadowColor: Color.fromRGBO(0, 0, 0, 0.5),
                            child: Container(
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 16),
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: TWColors.green.shade500,
                                            size: 32,
                                            semanticLabel: 'Check',
                                          ),
                                          SizedBox(width: 8),
                                          Text('ยินดีด้วย!',
                                              style: TextStyle(
                                                  fontFamily: 'Prompt',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, left: 6, right: 6),
                                          child: Text(
                                              'ขอแสดงความยินดีด้วย! เลขสลากกินแบ่งของคุณได้รับรางวัลที่ 1',
                                              style: TextStyle(
                                                  fontFamily: 'Niramit',
                                                  fontSize: 14)))
                                    ])))))
                  ])),
            ],
          ),
        )));
  }
}
