class LotteryResult {
  final String lotteryNumber;
  final String lotteryResult;
  final String lotteryReward;
  final String lotterDateCycle;

  LotteryResult(this.lotteryNumber, this.lotteryResult, this.lotteryReward, this.lotterDateCycle);

  factory LotteryResult.fromJson(Map<String, dynamic> json) {
    return LotteryResult(
      json['data']['lotteryNumber'],
      json['data']['lotteryResult'],
      json['data']['lotteryReward'],
      json['data']['lotterDateCycle'],
    );
  }

  String getRewardType(String result) {
    switch(result) {
      case 'prizeFirst':
        return 'รางวัลที่ 1';
      case 'prizeFirstNear':
        return 'รางวัลข้างเคียงรางวัลที่ 1';
      case 'prizeSecond':
        return 'รางวัลที่ 2';
      case 'prizeThird':
        return 'รางวัลที่ 3';
      case 'prizeForth':
        return 'รางวัลที่ 4';
      case 'prizeFifth':
        return 'รางวัลที่ 5';
      case 'runningNumberFrontThree':
        return 'รางวัลเลขหน้า 3 ตัว';
      case 'runningNumberBackThree':
        return 'รางวัลเลขท้าย 3 ตัว';
      case 'runningNumberBackTwo':
        return 'รางวัลเลขท้าย 2 ตัว';
      default:
        return '#';
    }
  }

  String printDetailedResult() {
    if (this.lotteryResult == 'none') {
      return 'asdasd';
    } else {
      return 'สลากกินแบ่งหมายเลข ${this.lotteryNumber} ได้รับ' + getRewardType(this.lotteryResult) + 'ในรอบสลากกินแบ่งวันที่ ${this.lotterDateCycle}';
    }
  }
}
