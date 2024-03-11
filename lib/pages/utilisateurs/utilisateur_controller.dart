import 'package:get/get.dart';
import 'package:ksij_admin_2/utils/requete.dart';

class UtilisateurController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  saveUtilisateur(Map d) async {
    //
    Response response = await requete.postE("utilisateur", d);
    if (response.isOk) {
      //
      Get.back();
      Get.back();
      getAllUtilisateur();
      Get.snackbar("Succès", "Save successfully");
    } else {
      //
      Get.back();
      Get.snackbar("Error", "Save not successfully");
    }
  }

  supprimer(String id) async {
    //
    Response response = await requete.deleteE("utilisateur/$id");
    if (response.isOk) {
      //
      print("erreur: ${response.statusCode}");
      print("erreur: ${response.body}");
      Get.back();
      getAllUtilisateur();
      Get.snackbar("Succès", "Deleted successfully");
    } else {
      print("erreur: ${response.statusCode}");
      print("erreur: ${response.body}");
      //
      Get.back();
      Get.snackbar("Error", "Save not successfully");
    }
  }

  //
  putUtilisateur(Map d) async {
    //
    Response response = await requete.putE("utilisateur", d);
    if (response.isOk) {
      //
      Get.back();
      //
      Get.back();
      //
      getAllUtilisateur();
      Get.snackbar("Succès", "Save successfully");
    } else {
      //
      Get.back();
      Get.snackbar("Error", "Save not successfully");
    }
  }

  //
  getAllUtilisateur() async {
    change([], status: RxStatus.loading());
    Response response = await requete.getE("utilisateur/all");
    if (response.isOk) {
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }
}
