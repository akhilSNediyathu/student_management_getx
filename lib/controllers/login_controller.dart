

import 'package:get/get.dart';
import 'package:student_management/view/home/screen_home.dart';

class LoginController extends GetxController{
  @override
  void onInit() {
  
    super.onInit();
    gotoLogin();
  }
   Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll( HomePage());
  }
}