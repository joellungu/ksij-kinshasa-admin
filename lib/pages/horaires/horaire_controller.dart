import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:ksij_admin_2/utils/requete.dart';

class HoraireController extends GetxController {
  //
  Requete requete = Requete();
  //
  saveEvent(Map d) async {
    //
    Response response = await requete.putE("priere", d);
    if (response.isOk) {
      //
      Get.back();
      Get.back();
      //allEvents();
      Get.snackbar("Succès", "Save successfully");
    } else {
      //
      Get.back();
      Get.back();
      Get.snackbar("Error", "Save not successfully");
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
  Future<Map> getDate(String dateTime) async {
    //
    //change({}, status: RxStatus.loading());
    //
    Response response = await requete.getE("priere/one/$dateTime");

    if (response.isOk) {
      print(response.body);
      //
      if (response.body == null) {
        return {};
      } else {
        return response.body;
      }
      //
    } else {
      //
      return {};
    }
  }

  //
}
