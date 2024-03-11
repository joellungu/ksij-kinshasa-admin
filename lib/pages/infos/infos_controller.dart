import 'dart:typed_data';
import 'package:dio/dio.dart' as io;
import 'package:get/get.dart';
import 'package:ksij_admin_2/utils/requete.dart';

class InfosController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  RxInt pr = 0.obs;
  //
  saveEvent1(Map d) async {
    //
    Response response = await requete.postE("infos", d);
    if (response.isOk) {
      //
      Get.back();
      Get.back();
      allEvents();
      Get.snackbar("Succès", "Save successfully");
    } else {
      //
      Get.back();
      Get.back();
      Get.snackbar("Error", "Save not successfully");
    }
  }

  saveEvent2(Map d, Uint8List file) async {
    //
    Response response = await requete.postE("infos", d);
    if (response.isOk) {
      //
      saveFichier(response.body, file);
      Get.back();
      Get.back();
      allEvents();
      Get.snackbar("Succès", "Save successfully");
    } else {
      //
      Get.back();
      Get.back();
      Get.snackbar("Error", "Save not successfully");
    }
  }

  saveFichier(String id, Uint8List file) async {
    //
    //Response response = await requete.postE("niveau/$id", file);
    io.Dio dio = io.Dio();
    dio.post(
      "${Requete.url}/infos/fichier/$id",
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

  //
  Future<bool> delete(String id) async {
    //
    Response response = await requete.deleteE("infos/$id");

    if (response.isOk) {
      //
      allEvents();
      //
      return true;
      //change(response.body, status: RxStatus.success());
    } else {
      //
      return false;
      //change([], status: RxStatus.empty());
    }
  }

  //
  allEvents() async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("infos/all");

    if (response.isOk) {
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }
}
