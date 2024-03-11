import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ksij_admin_2/pages/niveau/niveau_controller.dart';
import 'package:ksij_admin_2/utils/landi.dart';

import 'cours/cours.dart';

class Niveau extends GetView<NiveauController> {
  //
  final formKey = GlobalKey<FormState>();
  final titre = TextEditingController();
  //
  RxString filename = "".obs;
  //
  FilePickerResult? fl;
  //
  RxInt classe = 1.obs;
  //
  Rx<Widget> detail = Rx(Container());
  //
  Niveau() {
    controller.allEvents();
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
                              var nom = TextEditingController();
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
                                                Text(
                                                  "   New leve",
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
                                                          "assets/MdiAccountSchool.svg",

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
                                                      Container(
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Langi.base2,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .numbers,
                                                                      size: 30,
                                                                      color: Langi
                                                                          .base1),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 6,
                                                              child: Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                    "Classe"),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Obx(
                                                                () =>
                                                                    DropdownButtonHideUnderline(
                                                                  child:
                                                                      DropdownButton(
                                                                    value: classe
                                                                        .value,
                                                                    isExpanded:
                                                                        true,
                                                                    items: List
                                                                        .generate(
                                                                      11,
                                                                      (index) =>
                                                                          DropdownMenuItem(
                                                                        value:
                                                                            index +
                                                                                1,
                                                                        child:
                                                                            Text([
                                                                          "1",
                                                                          "2",
                                                                          "3",
                                                                          "4",
                                                                          "5",
                                                                          "6",
                                                                          "7",
                                                                          "8",
                                                                          "9",
                                                                          "10",
                                                                          "11"
                                                                        ][index]),
                                                                      ),
                                                                    ),
                                                                    onChanged:
                                                                        (j) {
                                                                      classe.value =
                                                                          j as int;
                                                                      print(classe
                                                                          .value);
                                                                    },
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
                                                      TextField(
                                                        controller: nom,
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            hintText:
                                                                "Title or name"),
                                                      ),
                                                      // const SizedBox(
                                                      //   height: 10,
                                                      // ),
                                                      // Container(
                                                      //   height: 50,
                                                      //   decoration:
                                                      //       BoxDecoration(
                                                      //     border: Border.all(
                                                      //       color: Langi.base2,
                                                      //       width: 1,
                                                      //     ),
                                                      //     borderRadius:
                                                      //         BorderRadius
                                                      //             .circular(20),
                                                      //   ),
                                                      //   child: Row(
                                                      //     mainAxisAlignment:
                                                      //         MainAxisAlignment
                                                      //             .spaceBetween,
                                                      //     children: [
                                                      //       Expanded(
                                                      //         flex: 1,
                                                      //         child: Row(
                                                      //           mainAxisAlignment:
                                                      //               MainAxisAlignment
                                                      //                   .start,
                                                      //           children: [
                                                      //             Icon(
                                                      //                 Icons
                                                      //                     .file_download_done,
                                                      //                 size: 30,
                                                      //                 color: Langi
                                                      //                     .base1),
                                                      //           ],
                                                      //         ),
                                                      //       ),
                                                      //       Expanded(
                                                      //         flex: 6,
                                                      //         child: Container(
                                                      //           alignment: Alignment
                                                      //               .centerLeft,
                                                      //           child: Obx(
                                                      //             () => Text(
                                                      //                 "${filename.value}"),
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //       Expanded(
                                                      //           flex: 4,
                                                      //           child:
                                                      //               ElevatedButton(
                                                      //             onPressed:
                                                      //                 () async {
                                                      //               //
                                                      //               FilePickerResult?
                                                      //                   result =
                                                      //                   await FilePicker
                                                      //                       .platform
                                                      //                       .pickFiles();

                                                      //               if (result !=
                                                      //                   null) {
                                                      //                 fl =
                                                      //                     result;
                                                      //                 filename
                                                      //                     .value = fl!
                                                      //                         .names[
                                                      //                     0]!;
                                                      //                 File file = File(result
                                                      //                     .files
                                                      //                     .single
                                                      //                     .path!);
                                                      //               } else {
                                                      //                 // User canceled the picker
                                                      //               }
                                                      //             },
                                                      //             child: Text(
                                                      //                 "Pick file"),
                                                      //           )),
                                                      //     ],
                                                      //   ),
                                                      // ),

                                                      const SizedBox(
                                                        height: 50,
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          //Get.off(Accueil());

                                                          Get.dialog(Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: Center(
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                color: Colors
                                                                    .white,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Obx(
                                                                  () =>
                                                                      CircularProgressIndicator(
                                                                    strokeWidth:
                                                                        4,
                                                                    value: double
                                                                        .parse(
                                                                            "${controller.pr.value}"),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ));

                                                          // Timer(Duration(seconds: 3), () {
                                                          //   Get.back();
                                                          //   Get.off(Accueil());
                                                          // });
                                                          /**public String nom;
    public String telephone;
    public String maman;
    public String niveau;
    public String mdp;
     */
                                                          Map e = {
                                                            "niveau":
                                                                classe.value,
                                                            "titre": nom.text
                                                          };
                                                          controller.saveNiveau(
                                                              e
                                                              // File(fl!.paths[0]!)
                                                              //     .readAsBytesSync(),
                                                              );
                                                          //Get.to(Cours());
                                                          //loginController.deja.value = true;
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
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: controller.obx(
                      (state) {
                        List us = state!;
                        return ListView(
                          padding: const EdgeInsets.all(10),
                          children: List.generate(us.length, (index) {
                            Map u = us[index];
                            return ListTile(
                              onTap: () {
                                //
                                detail.value = Cours(u['niveau']);
                              },
                              leading: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(
                                    25,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  "assets/PhUserDuotone.svg",
                                  colorFilter: ColorFilter.mode(
                                      Langi.base2, BlendMode.srcIn),
                                  semanticsLabel: "",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              title: const Text("Leve portal"),
                              subtitle: Text("${u['niveau']}"),
                              trailing: IconButton(
                                onPressed: () {
                                  //
                                  controller.deleteCours("${u['id']}");
                                  //
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red.shade700,
                                ),
                              ),
                            );
                          }),
                        );
                      },
                      onEmpty: Container(),
                      onLoading: const Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: double.maxFinite,
              width: 3,
              color: Colors.grey.shade200,
            ),
            Expanded(flex: 7, child: Obx(() => detail.value))
          ],
        ),
      ),
    );
  }
  //
}
