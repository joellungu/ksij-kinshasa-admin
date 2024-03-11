import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ksij_admin_2/utils/landi.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendrier_controller.dart';

class Calendrier extends GetView<CalendrierController> {
  //
  Rx<DateTime> date = Rx(DateTime.now());
  RxString titre = "".obs;
  RxString contenu = "".obs;
  RxInt couleur = 1.obs;
  TextEditingController eventDays = TextEditingController();
  TextEditingController lien = TextEditingController();
  //
  CalendrierController calendrierController = Get.find();
  //
  Calendrier() {
    DateTime d = DateTime.now();
    controller.getDate("${d.day}-${d.month}-${d.year}");
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Column(
        children: [
          Obx(
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
              )),
              onDaySelected: (d, t) {
                date.value = d;
                print("d: $d");
                print("t: $t");
                eventDays.text = "";
                controller.getDate("${d.day}-${d.month}-${d.year}");
                //var n = Random();
                //Map e = evenements[n.nextInt(3)];
                //titre.value = e['titre'];
                //contenu.value = e['contenu'];
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: controller.obx(
              (state) {
                Map ee = state!;
                print(ee);
                eventDays.text = ee['contenu'];
                couleur.value = ee['couleur'];

                return Container(
                  padding: const EdgeInsets.all(50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        //maxLines: 2,
                        controller: eventDays,
                        decoration: InputDecoration(
                          label: Text("Events"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                //
                                couleur.value = 0;
                              },
                              child: Obx(
                                () => Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: couleur.value == 0
                                          ? Colors.red.shade900
                                          : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //
                                couleur.value = 1;
                              },
                              child: Obx(
                                () => Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: couleur.value == 1
                                          ? Colors.red.shade900
                                          : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              //
                              Get.dialog(
                                Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(),
                                ),
                              );
                              /**
                         * public LocalDate dateTime;
    public String dateTimeLunaire;
    public String heure;
    public String titre;
    public String contenu;
    public int couleur;
                         */
                              var d = date.value;
                              //
                              Map e = {
                                "id": ee["id"],
                                "dateTime": "${d.day}-${d.month}-${d.year}",
                                "contenu": eventDays.text,
                                //"lien": lien.text,
                                "couleur": couleur.value,
                              };
                              //
                              print("data: $e");
                              //
                              controller.saveEvent(e);
                              //
                            },
                            child: Text("Update"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () async {
                              //
                              Get.dialog(
                                Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(),
                                ),
                              );
                              /**
                         * public LocalDate dateTime;
    public String dateTimeLunaire;
    public String heure;
    public String titre;
    public String contenu;
    public int couleur;
                         */
                              var d = date.value;
                              //
                              // Map e = {
                              //   "id": ee["id"],
                              //   "dateTime": "${d.day}-${d.month}-${d.year}",
                              //   "contenu": eventDays.text,
                              //   //"lien": lien.text,
                              //   "couleur": couleur.value,
                              // };
                              //
                              print("data: $e");
                              //DateTime d = date.value;
                              var dd = ("${d.day}-${d.month}-${d.year}");
                              bool v = await controller.supprimerCal(
                                  "${ee['id']}", dd);
                              if (v) {
                                controller
                                    .getDate("${d.day}-${d.month}-${d.year}");
                              }
                              //
                            },
                            child: const Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              onEmpty: Container(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      //maxLines: 2,
                      controller: eventDays,
                      decoration: InputDecoration(
                        label: Text("Events"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // TextField(
                    //   //maxLines: 2,
                    //   controller: lien,
                    //   decoration: InputDecoration(
                    //     label: Text("Link"),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(15),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              //
                              couleur.value = 0;
                            },
                            child: Obx(
                              () => Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: couleur.value == 0
                                        ? Colors.red.shade900
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //
                              couleur.value = 1;
                            },
                            child: Obx(
                              () => Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: couleur.value == 1
                                        ? Colors.red.shade900
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        //
                        Get.dialog(
                          Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                        );
                        /**
                         * public LocalDate dateTime;
    public String dateTimeLunaire;
    public String heure;
    public String titre;
    public String contenu;
    public int couleur;
                         */
                        var d = date.value;
                        //
                        Map e = {
                          "dateTime": "${d.day}-${d.month}-${d.year}",
                          "contenu": eventDays.text,
                          //"lien": lien.text,
                          "couleur": couleur.value,
                        };
                        //
                        controller.saveEvent(e);
                        //
                      },
                      child: Text("Save"),
                    ),
                  ],
                ),
              ),
              onLoading: const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
