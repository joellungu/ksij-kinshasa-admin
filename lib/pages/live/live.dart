import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ksij_admin_2/utils/landi.dart';

import 'live_controller.dart';

class Live extends GetView<LiveController> {
  //
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final description = TextEditingController();
  RxString date = "Date".obs;
  //
  Live() {
    //
    controller.allEvents();
    //
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text("Search"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 1,
                          color: Langi.base1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: InkWell(
                            onTap: () {
                              //
                              Get.dialog(
                                Material(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Container(
                                      //padding: EdgeInsets.all(10),
                                      height: Get.size.height / 1.1,
                                      width: 400,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "   New Live",
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
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Center(
                                              child: SingleChildScrollView(
                                                child: Form(
                                                  key: formKey,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        child: SvgPicture.asset(
                                                          "assets/IconParkSolidPlay.svg",

                                                          colorFilter:
                                                              ColorFilter.mode(
                                                                  Langi.base2,
                                                                  BlendMode
                                                                      .srcIn),

                                                          //semanticsLabel: e["titre"],
                                                          height: 100,
                                                          width: 100,
                                                        ),
                                                      ),
                                                      // Image.asset(
                                                      //   "assets/logo_MIN SANTE.png",
                                                      //   width: 300,
                                                      //   height: 300,
                                                      // ),
                                                      // const SizedBox(
                                                      //   height: 70,
                                                      // ),
                                                      // const Align(
                                                      //   alignment:
                                                      //       Alignment.center,
                                                      //   child: Text(
                                                      //     "Connectez-vous pour avoir accès au contenu du cours",
                                                      //     textAlign:
                                                      //         TextAlign.center,
                                                      //     style: TextStyle(
                                                      //       fontSize: 15,
                                                      //       fontWeight:
                                                      //           FontWeight.bold,
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextFormField(
                                                        controller: title,
                                                        validator: (e) {
                                                          if (e!.isEmpty) {
                                                            return "Please input the title";
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          5),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          prefixIcon:
                                                              const Icon(
                                                                  Icons.title),
                                                          hintText: "Title",
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextFormField(
                                                        controller: description,
                                                        //maxLines: 7,
                                                        validator: (e) {
                                                          if (e!.isEmpty) {
                                                            return "Please input the link";
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          5),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          prefixIcon:
                                                              const Icon(
                                                                  Icons.link),
                                                          label: Text("Link"),
                                                        ),
                                                      ),
                                                      // const SizedBox(
                                                      //   height: 20,
                                                      // ),
                                                      // Padding(
                                                      //   padding: EdgeInsets
                                                      //       .symmetric(
                                                      //           horizontal: 20),
                                                      //   child: Row(
                                                      //     mainAxisAlignment:
                                                      //         MainAxisAlignment
                                                      //             .spaceBetween,
                                                      //     children: [
                                                      //       Obx(() => Text(
                                                      //           date.value)),
                                                      //       IconButton(
                                                      //         onPressed: () {
                                                      //           //
                                                      //           showDatePicker(
                                                      //             context:
                                                      //                 context,
                                                      //             initialDate:
                                                      //                 DateTime
                                                      //                     .now(),
                                                      //             firstDate:
                                                      //                 DateTime(
                                                      //                     2023),
                                                      //             lastDate:
                                                      //                 DateTime(
                                                      //                     2050),
                                                      //           ).then((d) {
                                                      //             //
                                                      //             date.value =
                                                      //                 "${d!.day}-${d.month}-${d.year}";
                                                      //           });
                                                      //         },
                                                      //         icon: Icon(Icons
                                                      //             .date_range),
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),

                                                      ElevatedButton(
                                                        onPressed: () {
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            //Get.off(Accueil());

                                                            Get.dialog(
                                                                Container(
                                                              height: 40,
                                                              width: 40,
                                                              child:
                                                                  const CircularProgressIndicator(),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                            ));

                                                            // Timer(Duration(seconds: 3), () {
                                                            //   Get.back();
                                                            //   Get.off(Accueil());
                                                            // });
                                                            //
                                                            DateTime d =
                                                                DateTime.now();
                                                            //
                                                            Map e = {
                                                              "titre":
                                                                  title.text,
                                                              "lien":
                                                                  description
                                                                      .text,
                                                              "dateTime":
                                                                  "${d.day}-${d.month}-${d.year}"
                                                            };
                                                            controller
                                                                .saveEvent(e);
                                                            //
                                                            title.clear();
                                                            description.clear();
                                                            date.value = "";
                                                            //
                                                            //Get.to(Cours());
                                                            //loginController.deja.value = true;
                                                          }
                                                        },
                                                        style: ButtonStyle(
                                                          fixedSize:
                                                              MaterialStateProperty
                                                                  .all(
                                                            Size(
                                                              double.maxFinite,
                                                              45,
                                                            ),
                                                          ),
                                                          shape: MaterialStateProperty
                                                              .all(
                                                                  RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          )),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Langi
                                                                      .base1),
                                                        ),
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width:
                                                              double.maxFinite,
                                                          child: Text(
                                                            "Save",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      // OutlinedButton(
                                                      //   onPressed: () {
                                                      //     //
                                                      //     //Get.to(MdpOublie());
                                                      //   },
                                                      //   style: ButtonStyle(
                                                      //     fixedSize: MaterialStateProperty.all(
                                                      //       Size(
                                                      //         double.maxFinite,
                                                      //         45,
                                                      //       ),
                                                      //     ),
                                                      //     shape:
                                                      //         MaterialStateProperty.all(RoundedRectangleBorder(
                                                      //       borderRadius: BorderRadius.circular(20),
                                                      //     )),
                                                      //     //backgroundColor:
                                                      //     //  MaterialStateProperty.all(Colors.red.shade900),
                                                      //   ),
                                                      //   child: Container(
                                                      //     alignment: Alignment.center,
                                                      //     width: double.maxFinite,
                                                      //     child: const Text(
                                                      //       "Mot de passe oublié",
                                                      //       style: TextStyle(
                                                      //         color: Colors.black,
                                                      //         fontWeight: FontWeight.bold,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // )
                                                    ],
                                                  ),
                                                  //)
                                                ),
                                              ),
                                            ),
                                          ),
                                          // ElevatedButton(
                                          //   onPressed: () async {
                                          //     //
                                          //     //
                                          //   },
                                          //   child: Text("Save"),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Langi.base1,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: controller.obx(
                      (state) {
                        List l = state!;
                        return ListView(
                          padding: const EdgeInsets.all(10),
                          children: List.generate(l.length, (index) {
                            Map e = l[index];
                            return Card(
                              elevation: 1,
                              child: InkWell(
                                onTap: () {
                                  //
                                  //Get.to(DetailsTest());
                                  //
                                },
                                child: Container(
                                  height: 130,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Container(
                                          child: ListTile(
                                            // leading: Container(
                                            //   height: 50,
                                            //   width: 50,
                                            //   alignment: Alignment.center,
                                            //   child: Icon(
                                            //     CupertinoIcons.person,
                                            //     color: Colors.black,
                                            //     size: 35,
                                            //   ),
                                            //   decoration: BoxDecoration(
                                            //       borderRadius: BorderRadius.circular(25),
                                            //       color: Colors.deepPurple.shade100
                                            //           .withOpacity(0.7)),
                                            // ),
                                            title: Text(
                                              "${e['titre']}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            subtitle: Text(
                                              "${e['lien']}",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 1,
                                        color: Colors.grey,
                                        width: double.maxFinite,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: index % 2 == 2
                                                            ? Colors.red
                                                            : index % 2 == 1
                                                                ? Colors.green
                                                                : Colors.yellow
                                                                    .shade900,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${e['dateTime'] ?? ''}",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                      onLoading: Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                      onEmpty: Container(),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
