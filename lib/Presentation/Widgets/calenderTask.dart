import 'package:flutter/material.dart';

class CommonCalenderTask extends StatelessWidget {
  final String title;
  final String description;
  final String time;

  const CommonCalenderTask(
      {Key? key,
        required this.title,
        required this.description,
        required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0,right: 5,left: 15),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blueGrey)),
              width: double.infinity,
              height: 150,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      children: [
                        Container(
                            width: 140, height: 150, child: Icon(Icons.add)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  description,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blueGrey),
                                  textAlign: TextAlign.end,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              border: Border.all(color: Colors.blueGrey),
              color: Colors.black,
            ),
            padding: EdgeInsets.all(8),
            child: Text(
              time,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}