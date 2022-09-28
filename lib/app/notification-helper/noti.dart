import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../routes/app_pages.dart';

class Noti {
  static Future<void> intialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings('mipmap/ic_launcher');
    var iosInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iosInitialize);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: (payload) async{
      try{
        if(payload!=null && payload.isNotEmpty){
          Get.toNamed(Routes.HOME);
        }
      }
      catch(e){

      }

    });
   //for ios
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(sound:true,alert:true,badge:true   );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("---------------on message------------------");
     print("on message:${message.notification?.title}/${message.notification?.body}");

    });
  Noti.showBigTextNotification(title: "fff", body: "fff", fln: flutterLocalNotificationsPlugin);
  FirebaseMessaging.onMessageOpenedApp.listen((event) { print("hello")});
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payLoad,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformSpecific =
        AndroidNotificationDetails("WhatEverYouWant1", "chanel_name",
            playSound: true,
          importance: Importance.max,
          priority: Priority.high,
        );
    var not=NotificationDetails(android: androidPlatformSpecific,iOS: IOSNotificationDetails());
    await fln.show(0, title, body, not);


  }
}
