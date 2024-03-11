import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:ksij_admin_2/utils/requete.dart';

class CalendrierController extends GetxController with StateMixin<Map> {
  //
  Requete requete = Requete();
  //
  saveEvent(Map d) async {
    //
    Response response = await requete.putE("calendrier", d);
    if (response.isOk) {
      //
      Get.back();
      //allEvents();
      Get.snackbar("Succès", "Save successfully");
    } else {
      //
      Get.back();
      Get.snackbar("Error", "Save not successfully");
    }
  }

  //
  Future<bool> supprimerCal(String id, String dateTime) async {
    //
    Response response = await requete.deleteE("calendrier/$id");
    if (response.isOk) {
      //
      Get.back();
      //allEvents();
      Get.snackbar("Succès", "Delete successfully");
      getDate(dateTime);
      return true;
    } else {
      //
      Get.back();
      Get.snackbar("Error", "Delete not successfully");
      return false;
    }
  }

  //
  // allEvents() async {
  //   //
  //   change({}, status: RxStatus.loading());
  //   //
  //   Response response = await requete.getE("calendrier/all");

  //   if (response.isOk) {
  //     //
  //     change(response.body, status: RxStatus.success());
  //   } else {
  //     //
  //     change({}, status: RxStatus.empty());
  //   }
  // }

  //
  getDate(String dateTime) async {
    //
    change({}, status: RxStatus.loading());
    //
    Response response = await requete.getE("calendrier/one/$dateTime");

    if (response.isOk) {
      print(response.body);
      //
      if (response.body == null) {
        change({}, status: RxStatus.empty());
      } else {
        change(response.body, status: RxStatus.success());
      }
      //
    } else {
      //
      print(response.body);
      change({}, status: RxStatus.empty());
    }
  }
}
