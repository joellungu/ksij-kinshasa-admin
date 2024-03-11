import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ksij_admin_2/pages/niveau/niveau.dart';
import 'package:ksij_admin_2/utils/landi.dart';

import 'calendrier/calendrier.dart';
import 'calendrier/calendrier_controller.dart';
import 'evenements/evenement.dart';
import 'evenements/evenement_controller.dart';
import 'horaires/horaire.dart';
import 'horaires/horaire_controller.dart';
import 'infos/infos.dart';
import 'infos/infos_controller.dart';
import 'live/live.dart';
import 'live/live_controller.dart';
import 'niveau/cours/cours_controller.dart';
import 'niveau/niveau_controller.dart';
import 'utilisateurs/utilisateur.dart';
import 'utilisateurs/utilisateur_controller.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _Accueil();
}

class _Accueil extends State<Accueil> with TickerProviderStateMixin {
  late final TabController _tabController;
  //
  EvenementController evenementController = Get.put(EvenementController());
  //
  UtilisateurController utilisateurController =
      Get.put(UtilisateurController());
  //
  CalendrierController calendrierController = Get.put(CalendrierController());
  //
  HoraireController horaireController = Get.put(HoraireController());
  //
  InfosController infosController = Get.put(InfosController());
  //
  LiveController liveController = Get.put(LiveController());
  //
  NiveauController niveauController = Get.put(NiveauController());
  //
  CoursController controller = Get.put(CoursController());
  //
  //Horaire//Calendrier//Evenement//Utilisateur//Infos//Live/
  Rx<Widget> vue = Rx(Calendrier());
  RxInt choix = 0.obs;
  //
  List angles = [
    {"titre": "Calendar", "icon": "HeroiconsCalendarDaysSolid"},
    {"titre": "Events", "icon": "PhCalendarCheckFill"},
    {"titre": "News", "icon": "JamNewspaperF"},
    {"titre": "Times", "icon": "TablerPray"},
    {"titre": "Live", "icon": "IconParkSolidPlay"},
    {"titre": "Users", "icon": "PhUserDuotone"},
    {"titre": "Leve", "icon": "MdiAccountSchool"},
  ];
  //
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Langi.base1,
      child: SafeArea(
        child: Scaffold(
          body: Obx(() => vue.value),
          bottomNavigationBar: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(angles.length, (index) {
                Map e = angles[index];
                return InkWell(
                  onTap: () {
                    //
                    choix.value = index;
                    //
                    if (choix.value == 0) {
                      vue.value = Calendrier();
                    } else if (choix.value == 1) {
                      vue.value = Evenement();
                    } else if (choix.value == 2) {
                      vue.value = Infos();
                    } else if (choix.value == 3) {
                      vue.value = Horaire();
                    } else if (choix.value == 4) {
                      vue.value = Live();
                    } else if (choix.value == 5) {
                      vue.value = Utilisateur();
                    } else {
                      vue.value = Niveau();
                    }
                  },
                  child: Obx(
                    () => Container(
                      //flex: 1,
                      width: 50,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/${e["icon"]}.svg",
                            colorFilter: index == choix.value
                                ? ColorFilter.mode(Langi.base2, BlendMode.srcIn)
                                : ColorFilter.mode(
                                    Colors.grey, BlendMode.srcIn),
                            semanticsLabel: e["titre"],
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            e["titre"],
                            style: TextStyle(
                              fontSize: 10,
                              color: index == choix.value
                                  ? Langi.base2
                                  : Colors.grey,
                              fontWeight: index == choix.value
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
