import 'package:flutter/material.dart';
import 'package:niku/niku.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

import 'LotteryResult.dart';

class Result extends StatelessWidget {
  // Declare a field that holds the Todo.
  final LotteryResult lotteryResult;

  // In the constructor, require a Todo.
  Result({Key key, @required this.lotteryResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(lotteryResult.lotteryNumber),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(lotteryResult.lotteryResult),
      ),
    );
  }
}
