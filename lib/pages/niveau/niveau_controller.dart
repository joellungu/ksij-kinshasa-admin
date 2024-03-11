import 'dart:typed_data';

import 'package:dio/dio.dart' as io;
import 'package:get/get.dart';
import 'package:ksij_admin_2/utils/requete.dart';

class NiveauController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  RxInt pr = 0.obs;
  //
  saveNiveau(Map d) async {
    //, dynamic file
    Response response = await requete.postE("niveau", d);
    if (response.isOk) {
      //
      print("permier parti ok ...");
      //
      //saveFichier(response.body, file);
      //
      Get.back();
      Get.back();
      allEvents();
      //Get.snackbar("Succès", "Save successfully");
    } else {
      print(response.statusCode);
      print(response.body);
      //
      Get.back();
      Get.back();
      Get.snackbar("Error", "Save not successfully 1");
    }
  }

  saveFichier(String id, Uint8List file) async {
    //
    //Response response = await requete.postE("niveau/$id", file);
    io.Dio dio = io.Dio();
    dio.post(
      "${Requete.url}/niveau/$id",
      data: file,
      options: io.Options(method: "POST", contentType: "*/*"),
      onSendProgress: (received, total) {
        int percentage = ((received / total) * 100)
            .floor(); //this is what I want to listen to from my ViewModel class
        pr.value = percentage;
        print("le pourcent: $percentage");
      },
    );
  }

  deleteCours(String id) async {
    //
    Response response = await requete.delete(
      "${Requete.url}/niveau/$id",
    );
    //
    if (response.isOk) {
      //
      allEvents();
    } else {
      //
      allEvents();
    }
  }

  //
  allEvents() async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("niveau/all");

    if (response.isOk) {
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }

  //

  void downloadFile() {}
}
