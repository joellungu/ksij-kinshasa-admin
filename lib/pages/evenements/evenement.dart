import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ksij_admin_2/utils/landi.dart';
import 'package:ksij_admin_2/utils/requete.dart';
import 'evenement_controller.dart';

class Evenement extends GetView<EvenementController> {
  //
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final soustitle = TextEditingController();
  RxBool c_soustitre = true.obs;
  final description = TextEditingController();
  RxString date = "Date".obs;
  //
  XFile? image;
  final ImagePicker picker = ImagePicker();
  //
  Rx<Widget> vue = Rx(Container());
  RxBool photo_vue = false.obs;
  //
  RxString filename = "".obs;
  //
  FilePickerResult? fl;
  //
  Evenement() {
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
                                      child: SingleChildScrollView(
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
                                                    "   New Events",
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Center(
                                                child: SingleChildScrollView(
                                                  child: Form(
                                                    key: formKey,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          height: 130,
                                                          width: 130,
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    //

                                                                    image = await picker.pickImage(
                                                                        source: ImageSource
                                                                            .gallery,
                                                                        imageQuality:
                                                                            80,
                                                                        maxHeight:
                                                                            500,
                                                                        maxWidth:
                                                                            500);
                                                                    //
                                                                    if (image !=
                                                                        null) {
                                                                      photo_vue
                                                                              .value =
                                                                          true;
                                                                    } else {
                                                                      photo_vue
                                                                              .value =
                                                                          false;
                                                                    }
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .camera),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    //
                                                                    image = await picker.pickImage(
                                                                        source: ImageSource
                                                                            .gallery,
                                                                        imageQuality:
                                                                            80,
                                                                        maxHeight:
                                                                            500,
                                                                        maxWidth:
                                                                            500);
                                                                    if (image !=
                                                                        null) {
                                                                      photo_vue
                                                                              .value =
                                                                          false;
                                                                      photo_vue
                                                                              .value =
                                                                          true;
                                                                    } else {
                                                                      photo_vue
                                                                              .value =
                                                                          false;
                                                                    }
                                                                  },
                                                                  child: Obx(
                                                                    () => photo_vue
                                                                            .value
                                                                        ? Container(
                                                                            height:
                                                                                100,
                                                                            width:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(image: DecorationImage(image: FileImage(File(image!.path))), borderRadius: BorderRadius.circular(10)),
                                                                            //child:
                                                                            // Image.file(File(image!.path)),
                                                                          )
                                                                        : SizedBox(
                                                                            height:
                                                                                100,
                                                                            width:
                                                                                100,
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              "assets/PhCalendarCheckFill.svg",

                                                                              colorFilter: ColorFilter.mode(Langi.base2, BlendMode.srcIn),

                                                                              //semanticsLabel: e["titre"],
                                                                              height: 100,
                                                                              width: 100,
                                                                            ),
                                                                          ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
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
                                                              color:
                                                                  Langi.base2,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
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
                                                                            .file_download_done,
                                                                        size:
                                                                            30,
                                                                        color: Langi
                                                                            .base1),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 6,
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Obx(
                                                                    () => Text(
                                                                        "${filename.value}"),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 4,
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    //
                                                                    FilePickerResult?
                                                                        result =
                                                                        await FilePicker
                                                                            .platform
                                                                            .pickFiles();

                                                                    if (result !=
                                                                        null) {
                                                                      fl =
                                                                          result;
                                                                      filename
                                                                          .value = fl!
                                                                              .names[
                                                                          0]!;
                                                                      File file = File(result
                                                                          .files
                                                                          .single
                                                                          .path!);
                                                                    } else {
                                                                      // User canceled the picker
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                      "Pick file"),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

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
                                                                const Icon(Icons
                                                                    .title),
                                                            hintText: "Title",
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              description,
                                                          maxLines: 7,
                                                          validator: (e) {
                                                            if (e!.isEmpty) {
                                                              return "Please input the description";
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
                                                            // prefixIcon:
                                                            //     const Icon(Icons
                                                            //         .details),
                                                            label: Text(
                                                                "Description"),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Obx(
                                                          () => Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Checkbox(
                                                                value:
                                                                    c_soustitre
                                                                        .value,
                                                                onChanged: (e) {
                                                                  //

                                                                  c_soustitre
                                                                          .value =
                                                                      e as bool;
                                                                },
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      soustitle,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  enabled:
                                                                      c_soustitre
                                                                          .value,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding:
                                                                        EdgeInsets.symmetric(
                                                                            vertical:
                                                                                5),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    ),
                                                                    // prefixIcon:
                                                                    //     const Icon(Icons
                                                                    //         .details),
                                                                    label: Text(
                                                                        "subtitle"),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Obx(() => Text(
                                                                  date.value)),
                                                              IconButton(
                                                                onPressed: () {
                                                                  //
                                                                  showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime(
                                                                            2023),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2050),
                                                                  ).then((d) {
                                                                    //
                                                                    date.value =
                                                                        "${d!.day}-${d.month}-${d.year}";
                                                                  });
                                                                },
                                                                icon: Icon(Icons
                                                                    .date_range),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
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
                                                              Map e = {
                                                                "titre":
                                                                    title.text,
                                                                "sousTitre":
                                                                    soustitle
                                                                        .text,
                                                                "contenu":
                                                                    description
                                                                        .text,
                                                                "dateTime":
                                                                    date.value,
                                                                "asPhoto":
                                                                    photo_vue
                                                                        .value,
                                                                "photo": photo_vue
                                                                        .value
                                                                    ? File(image!
                                                                            .path)
                                                                        .readAsBytesSync()
                                                                    : null,
                                                                "asPdf": filename
                                                                        .value !=
                                                                    "",
                                                                //"pdf":
                                                              };
                                                              if (filename
                                                                      .value ==
                                                                  "") {
                                                                controller
                                                                    .saveEvent1(
                                                                  e,
                                                                );
                                                              } else {
                                                                controller
                                                                    .saveEvent2(
                                                                  e,
                                                                  File(fl!.paths[
                                                                          0]!)
                                                                      .readAsBytesSync(),
                                                                );
                                                              }
                                                              //
                                                              title.clear();
                                                              description
                                                                  .clear();
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
                                                                double
                                                                    .maxFinite,
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
                                                            alignment: Alignment
                                                                .center,
                                                            width: double
                                                                .maxFinite,
                                                            child: Text(
                                                              "Save",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                              child: const Icon(
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
                                  vue.value = details(e);
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
                                                fontSize: 15,
                                              ),
                                            ),
                                            subtitle: Text(
                                              "${e['contenu']}",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
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
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
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
              child: Obx(() => vue.value),
            )
          ],
        ),
      ),
    );
  }

  Widget details(Map e) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: e["asPhoto"]
              ? Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          "${Requete.url}/evenement/photo/${e["id"]}"),
                    ),
                  ),
                )
              : Container(),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(30),
            height: 300,
            width: 400,
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
                        "${e['contenu']}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: true
                                      ? Colors.red
                                      : false
                                          ? Colors.green
                                          : Colors.yellow.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${e['dateTime'] ?? ''}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
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
        ElevatedButton(
          onPressed: () async {
            //

            //
            bool v = await controller.delete("${e["id"]}");
            //
            if (v) {
              vue.value = Container();
            } else {
              Get.snackbar("Erreur", "There was a problem deleting");
            }
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red.shade900)),
          child: Text(
            "Delete",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
