
import 'package:get/get.dart';

import '../../../notification-helper/noti.dart';
import 'package:firebase_push_with_local_notification/main.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    Noti.intialize(flutterLocalNotificationsPlugin);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
