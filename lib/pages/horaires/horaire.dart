import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ksij_admin_2/pages/horaires/horaire_controller.dart';
import 'package:ksij_admin_2/utils/landi.dart';
import 'package:table_calendar/table_calendar.dart';

class Horaire extends GetView<HoraireController> {
  //
  Rx<DateTime> date = Rx(DateTime.now());
  RxString titre = "".obs;
  RxString contenu = "".obs;
  //
  HoraireController horaireController = Get.find();
  //
  RxString Imsak = "".obs;
  RxString Fajr = "".obs;
  RxString Sunrise = "".obs;
  RxString Zuhr = "".obs;
  RxString Sunset = "".obs;
  RxString Maghrib = "".obs;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(date.value, day);
            },
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: date.value,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Langi.base1,
              ),
            ),
            onDaySelected: (d, t) {
              date.value = d;
              print("d: $d");
              print("t: $t");
              String da = "${d.day}-${d.month}-${d.year}";
              //
              //
              Maghrib.value = "";
              Sunset.value = "";
              Zuhr.value = "";
              Sunrise.value = "";
              Fajr.value = "";
              Imsak.value = "";
              //
              //var n = Random();
              //Map e = evenements[n.nextInt(3)];
              //titre.value = e['titre'];
              //contenu.value = e['contenu'];
              //
              Get.dialog(
                Material(
                  color: Colors.transparent,
                  child: FutureBuilder(
                    future: controller.getDate(da),
                    builder: (c, t) {
                      if (t.hasData) {
                        Map e = t.data as Map;
                        print("e : $e ${e['dateTime'] == null}");
                        if (e['dateTime'] == null) {
                          return Center(
                            child: Container(
                              //padding: const EdgeInsets.all(10),
                              height: Get.size.height / 1.1,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 40,
                                    //da
                                    decoration: BoxDecoration(
                                      color: Langi.base1,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "  $da",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            //
                                            Get.back();
                                            //
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Imsak"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child:
                                                  Obx(() => Text(Imsak.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Imsak.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Fajr"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child:
                                                  Obx(() => Text(Fajr.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Fajr.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Sunrise"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Obx(
                                                  () => Text(Sunrise.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Sunrise.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Zuhr"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child:
                                                  Obx(() => Text(Zuhr.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Zuhr.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Sunset"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child:
                                                  Obx(() => Text(Sunset.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Sunset.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Maghrib"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Obx(
                                                  () => Text(Maghrib.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Maghrib.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      //
                                      Get.dialog(
                                        Container(
                                          height: 40,
                                          width: 40,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(),
                                        ),
                                      );

                                      //
                                      Map h = {
                                        "dateTime": da,
                                        "horaires": [
                                          {
                                            "priere": "Imsak",
                                            "heure": Imsak.value
                                          },
                                          {
                                            "priere": "Fajr",
                                            "heure": Fajr.value
                                          },
                                          {
                                            "priere": "Sunrise",
                                            "heure": Sunrise.value
                                          },
                                          {
                                            "priere": "Zuhr",
                                            "heure": Zuhr.value
                                          },
                                          {
                                            "priere": "Sunset",
                                            "heure": Sunset.value
                                          },
                                          {
                                            "priere": "Maghrib",
                                            "heure": Maghrib.value
                                          },
                                        ],
                                      };
                                      //
                                      controller.saveEvent(h);
                                      //
                                      Maghrib.value = "";
                                      Sunset.value = "";
                                      Zuhr.value = "";
                                      Sunrise.value = "";
                                      Fajr.value = "";
                                      Imsak.value = "";
                                      //
                                    },
                                    child: Text("Save"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          //
                          Maghrib.value = e['horaires'][5]["heure"];
                          Sunset.value = e['horaires'][4]["heure"];
                          Zuhr.value = e['horaires'][3]["heure"];
                          Sunrise.value = e['horaires'][2]["heure"];
                          Fajr.value = e['horaires'][1]["heure"];
                          Imsak.value = e['horaires'][0]["heure"];
                          //
                          return Center(
                            child: Container(
                              //padding: const EdgeInsets.all(10),
                              height: Get.size.height / 1.1,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 40,
                                    //da
                                    decoration: BoxDecoration(
                                      color: Langi.base1,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "  $da",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            //
                                            Get.back();
                                            //
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Imsak"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child:
                                                  Obx(() => Text(Imsak.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Imsak.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Fajr"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child:
                                                  Obx(() => Text(Fajr.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Fajr.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Sunrise"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Obx(
                                                  () => Text(Sunrise.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Sunrise.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Zuhr"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child:
                                                  Obx(() => Text(Zuhr.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Zuhr.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Sunset"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child:
                                                  Obx(() => Text(Sunset.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Sunset.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text("Maghrib"),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Obx(
                                                  () => Text(Maghrib.value)),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                onPressed: () {
                                                  //
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((t) {
                                                    //
                                                    Maghrib.value =
                                                        "${t!.hour}h : ${t.minute}min";
                                                    print("time: $t");
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.timelapse),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      //
                                      Get.dialog(
                                        Container(
                                          height: 40,
                                          width: 40,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(),
                                        ),
                                      );

                                      //
                                      Map h = {
                                        "id": e['id'],
                                        "dateTime": da,
                                        "horaires": [
                                          {
                                            "priere": "Imsak",
                                            "heure": Imsak.value
                                          },
                                          {
                                            "priere": "Fajr",
                                            "heure": Fajr.value
                                          },
                                          {
                                            "priere": "Sunrise",
                                            "heure": Sunrise.value
                                          },
                                          {
                                            "priere": "Zuhr",
                                            "heure": Zuhr.value
                                          },
                                          {
                                            "priere": "Sunset",
                                            "heure": Sunset.value
                                          },
                                          {
                                            "priere": "Maghrib",
                                            "heure": Maghrib.value
                                          },
                                        ],
                                      };
                                      //
                                      controller.saveEvent(h);
                                      //
                                      Maghrib.value = "";
                                      Sunset.value = "";
                                      Zuhr.value = "";
                                      Sunrise.value = "";
                                      Fajr.value = "";
                                      Imsak.value = "";
                                      //
                                    },
                                    child: Text("   Update   "),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      } else if (t.hasError) {
                        return Container();
                      }
                      return Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          child: const CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
