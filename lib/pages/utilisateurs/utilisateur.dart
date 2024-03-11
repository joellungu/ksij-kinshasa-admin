import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ksij_admin_2/utils/landi.dart';

import 'utilisateur_controller.dart';

class Utilisateur extends GetView<UtilisateurController> {
  //
  //
  final formKey = GlobalKey<FormState>();
  final mother = TextEditingController();
  final mdp = TextEditingController();
  final noms = TextEditingController();
  final adresse = TextEditingController();
  final telephone = TextEditingController();
  //
  RxBool vue = true.obs;
  Rx<Widget> detail = Rx(Container());
  //
  RxInt classe = 1.obs;
  //
  Utilisateur() {
    controller.getAllUtilisateur();
  }

  //LoginController loginController = Get.find();
  RxBool masquer = true.obs;
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
                                                Text(
                                                  "   New User",
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
                                                          "assets/PhUserDuotone.svg",

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
                                                        controller: noms,
                                                        validator: (e) {
                                                          if (e!.isEmpty) {
                                                            return "Please input the name";
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
                                                                  Icons.person),
                                                          hintText: "Name",
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextFormField(
                                                        controller: telephone,
                                                        validator: (e) {
                                                          if (e!.isEmpty) {
                                                            return "Please input the phone number";
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
                                                                  .phone_android),
                                                          hintText:
                                                              "Phone number",
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextFormField(
                                                        controller: mother,
                                                        validator: (e) {
                                                          if (e!.isEmpty) {
                                                            return "Please input the mother name";
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
                                                                  Icons.people),
                                                          hintText: "mother",
                                                        ),
                                                      ),
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
                                                                      8,
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
                                                        height: 20,
                                                      ),
                                                      Obx(
                                                        () => TextFormField(
                                                          controller: mdp,
                                                          obscureText:
                                                              masquer.value,
                                                          validator: (e) {
                                                            if (e!.isEmpty) {
                                                              return "Please put your email";
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
                                                            prefixIcon: Obx(
                                                              () => IconButton(
                                                                icon: vue.value
                                                                    ? Icon(Icons
                                                                        .lock)
                                                                    : Icon(Icons
                                                                        .lock),
                                                                onPressed: () {
                                                                  //
                                                                  masquer.value =
                                                                      !masquer
                                                                          .value;
                                                                },
                                                              ),
                                                            ),
                                                            hintText:
                                                                "Pass word",
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 50,
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
                                                            /**public String nom;
    public String telephone;
    public String maman;
    public String niveau;
    public String mdp;
     */
                                                            Map e = {
                                                              "nom": noms.text,
                                                              "telephone":
                                                                  telephone
                                                                      .text,
                                                              "maman":
                                                                  mother.text,
                                                              "niveau":
                                                                  classe.value,
                                                              "mdp": mdp.text,
                                                            };
                                                            controller
                                                                .saveUtilisateur(
                                                                    e);
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
                                print(u);
                                detail.value = Details(u);
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
                              title: Text("${u['nom']}"),
                              subtitle: Text("${u['telephone']}"),
                              trailing: IconButton(
                                onPressed: () {
                                  //
                                  Get.dialog(
                                    Center(
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                    ),
                                  );
                                  //
                                  controller.supprimer("${u['id']}");
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
            Expanded(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Obx(() => detail.value)],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Details extends StatefulWidget {
  Map u;
  Details(this.u);
  //
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Details();
  }
}

class _Details extends State<Details> {
  //
  UtilisateurController utilisateurController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 350,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: Icon(Icons.person),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
            ),
            title: Text("Name"),
            subtitle: Text("${widget.u['nom']}"),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                var adresse = TextEditingController();
                //
                modifierInfo(widget.u, context, adresse, "nom");
              },
            ),
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: Icon(Icons.phone_android),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
            ),
            title: Text("Phone number"),
            subtitle: Text("${widget.u['telephone']}"),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                var adresse = TextEditingController();
                //
                modifierInfo(widget.u, context, adresse, "telephone");
              },
            ),
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: Icon(Icons.people),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
            ),
            title: Text("Mother"),
            subtitle: Text("${widget.u['maman']}"),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                var adresse = TextEditingController();
                //
                modifierInfo(widget.u, context, adresse, "maman");
              },
            ),
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: Icon(Icons.numbers),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
            ),
            title: Text("Leve"),
            subtitle: Text("${widget.u['niveau']}"),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                var adresse = TextEditingController();
                //
                modifierInfo(widget.u, context, adresse, "niveau");
              },
            ),
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: Icon(Icons.password),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
            ),
            title: Text("Password"),
            subtitle: Text("${widget.u['mdp']}"),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                var adresse = TextEditingController();
                //
                modifierInfo(widget.u, context, adresse, "mdp");
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  modifierInfo(
    Map e,
    BuildContext context,
    TextEditingController text,
    String nom,
  ) async {
    text.text = e[nom];
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("${nom.capitalize}"),
          contentPadding: const EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 250,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        //prefixIcon: const Icon(Icons.person),
                        hintText: 'nom'.tr,
                        labelText: 'nom'.tr,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'nom_message'.tr;
                        }

                        return null;
                      },
                      onChanged: (value) {
                        //print("Password value $value");
                      },
                    ),
                    InkWell(
                      onTap: () {
                        e[nom] = text.text;
                        Get.dialog(
                          const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        utilisateurController.putUtilisateur(e);
                        //Mise ) jour ici...
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 2,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 2,
                          ),
                          child: Text(
                            "Enregistrer".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade900,
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                            // ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
