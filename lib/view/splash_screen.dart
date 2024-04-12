import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/controllers/login_controller.dart';
import 'package:student_management/core/colors.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolo.white, 
      body: Center(
        child:GetBuilder<LoginController>(builder: (loginController){
          return  SizedBox(child: Image.asset('assets/logo_prev_ui.png'));
        },)
      ),


    );
  }
}