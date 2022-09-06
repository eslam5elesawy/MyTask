import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_task/Presentation/Screens/create_new_task.dart';

import '../Widgets/calenderItem.dart';
import '../Widgets/calenderTask.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  List<int> dayInMonth = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<String> dayInWeak = ['Sa', 'Su', 'Mo', 'Tu', 'We', 'Th', 'Fr'];

  bool isToday = true;

  List<String> taskTitles = ['Team Meeting', 'Call the Stylist', 'Check mail'];
  List<String> taskDescriptions = [
    'Discuss all questions about new project',
    'agree on an evening look',
    'write to the manager'
  ];
  List<String> taskTime = ['10:00 AM', '11:00 AM', '11:30 AM'];

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            SizedBox(
                width: 35,
                child: Image(image: AssetImage('images/menu_icon_2.png'))),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.notifications_outlined,
              color: Colors.blue,
              size: 30,
            ),
          ],
        ),
        actions: [
          Container(
            width: 60,
            decoration: const BoxDecoration(
              color: Colors.blue,),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topRight: Radius.circular(45))),
            ),
          ),
          Container(
            height: 70,
            width: 100,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(35))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: 15,),
                Icon(Icons.person),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 20, right: 30),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          'My Task',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35.0),
                        )),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewTask()),
                                );
                              },
                              child: const Text(
                                '+',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          'Today',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        )),
                        Text(
                          DateFormat('EEEE, d MMMM').format(DateTime.now()),
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.blueGrey.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 40),
                    child: SizedBox(
                      height: 60,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CommonCalenderItem(
                              dayInMonth: dayInMonth[index],
                              dayInWeak: dayInWeak[index],
                              isToday: index == 0),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 15.0,
                              ),
                          itemCount: dayInWeak.length),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(45))),
                height: taskTitles.length * 165,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 25),
                  child: RawScrollbar(
                    thumbColor: Colors.black,
                    thickness: 3,
                    trackVisibility: true,
                    minThumbLength: 1,
                    scrollbarOrientation: ScrollbarOrientation.left,
                    thumbVisibility: true,
                    child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => CommonCalenderTask(
                            title: taskTitles[index],
                            description: taskDescriptions[index],
                            time: taskTime[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10.0,
                            ),
                        itemCount: taskTitles.length),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
