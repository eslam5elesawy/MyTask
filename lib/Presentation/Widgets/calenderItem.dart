import 'package:flutter/material.dart';

class CommonCalenderItem extends StatelessWidget {
  final int dayInMonth;
  final String dayInWeak;

  final bool isToday;

  const CommonCalenderItem(
      {Key? key,
        required this.dayInMonth,
        required this.dayInWeak,
        required this.isToday})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isToday ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: isToday ? Colors.blue : Colors.blueGrey)),
      width: 60,
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${dayInMonth < 10 ? '0$dayInMonth' : dayInMonth}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: isToday ? Colors.white : Colors.black),
          ),
          Text(
            dayInWeak,
            style: TextStyle(
                fontSize: 15, color: isToday ? Colors.white : Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}