import 'package:Fahkap/repository/MyRepo.dart';
import 'package:Fahkap/utils/Services/ApiClient.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../controller/MyController.dart';

Future<void> initApp() async {
   
  Get.find<MyController>().readData();
  Get.find<MyController>().getPosition();
  Get.find<MyController>().getListUser();
  Get.find<MyController>().getListSalle();
  Get.find<MyController>().getListReservation();
  Get.find<MyController>().getListBatiment();
}

Future<void> initServices() async {
  Get.put(ApiClient());
  Get.put(MyRepo(apiClient: Get.find()));

  Get.put(MyController(myRepo: Get.find()), permanent: true);
}
