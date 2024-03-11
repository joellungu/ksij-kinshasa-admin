import 'package:get/get.dart';
import 'package:ksij_admin_2/utils/requete.dart';

class LiveController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  saveEvent(Map d) async {
    //
    Response response = await requete.postE("live", d);
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

  //
  allEvents() async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("live/all");

    if (response.isOk) {
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }

  //
  lastLive() async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("live/all");

    if (response.isOk) {
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }
}
