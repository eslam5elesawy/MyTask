import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Widgets/inputFormField.dart';


class NewTask extends StatelessWidget {
  NewTask({Key? key}) : super(key: key);

  List<String> category = [
    'Development',
    'Research',
    'Design',
    'Backend',
    'Frontend',
    'Database',
    'Mobile'
  ];

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ), onPressed: () { Navigator.pop(context); },
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Container(
              width: 35,
                child: const Image(image: AssetImage('images/menu_icon_2.png'))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, top:10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Create New Task',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )),
                    Icon(
                      Icons.task,
                      size: 40,
                      color: Colors.blueGrey.withOpacity(0.6),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 40,top: 20),
                  child: CommonInputFormField(
                    controller: nameController,
                    labelText: 'Task Name',
                    function: () {},
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 40, bottom: 20,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                        child: Text(
                      'Select Category',
                      style: TextStyle(fontSize: 18),
                    )),
                    Text('See all'),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              color: index == 0 ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: index == 0
                                      ? Colors.blue
                                      : Colors.blueGrey)),
                          height: 30,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                category[index],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: index == 0
                                        ? Colors.white
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 15.0,
                        ),
                    itemCount: category.length),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 40, top: 20, bottom: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: CommonInputFormField(
                      labelText: 'Date',
                      controller: dateController,
                      isReadOnly: true,
                      function: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.utc(DateTime.now().year + 1))
                            .then((value) {
                          dateController.text =
                              DateFormat('EEEE, d MMMM').format(value!);
                        });
                      },
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueGrey.withOpacity(0.6),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime.utc(DateTime.now().year + 1))
                                  .then((value) {
                                dateController.text =
                                    DateFormat('EEEE, d MMMM').format(value!);
                              });
                            },
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40,bottom: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: CommonInputFormField(
                      labelText: 'Start Time',
                      controller: startTimeController,
                      isReadOnly: true,
                      function: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          startTimeController.text =
                              value!.format(context).toString();
                        });
                      },
                    )),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                        child: CommonInputFormField(
                      labelText: 'End Time',
                      controller: endTimeController,
                      isReadOnly: true,
                      function: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          endTimeController.text =
                              value!.format(context).toString();
                        });
                      },
                    ))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: CommonInputFormField(
                    labelText: 'Description',
                    controller: desController,
                    isReadOnly: false,
                    function: () {},
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: 250,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Create Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
