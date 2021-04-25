import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
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
      body: NikuColumn([
        HeroIcon(
          lotteryResult.lotteryResult == 'none' ? HeroIcons.xCircle : HeroIcons.checkCircle,
          color: lotteryResult.lotteryResult == 'none' ? TWColors.red.shade500 : TWColors.green.shade500,
          size: 100,
        ),
        NikuText(lotteryResult.lotteryResult == 'none' ? 'น่าเสียดาย' : 'ขอแสดงความยินดีด้วย!')
          .fontFamily('Prompt')
          .fontSize(24)
          .fontWeight(FontWeight.w600)
          .mt(10),
        NikuText(
          LotteryResult(
            lotteryResult.lotteryNumber,
            lotteryResult.lotteryResult,
            lotteryResult.lotteryReward,
            lotteryResult.lotterDateCycle
          ).printDetailedResult()
        )
          .fontFamily('Niramit').fontSize(16).alignCenter().mt(6).mx(18),
        NikuButton(
          NikuText('กลับสู่หน้าหลัก').fontSize(14).fontFamily('Niramit').fontSize(14).color(Colors.white)
        )
          .onPressed(() {
            Navigator.pop(context);
          })
          .bg(TWColors.blue.shade700)
          .px(22)
          .py(10)
          .niku()
          .mt(24),
      ])
        .mainStart()
        .crossAxisAlignment(CrossAxisAlignment.center)
        .niku()
        .pt(120)
        .width(MediaQuery.of(context).size.width)
    ).niku();
  }
}
