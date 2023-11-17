import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/app/networks/dio/repo/auth_repo.dart';
import 'package:getx_example/app/networks/models/user_model.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
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

  onLoginClicked() async{
    final AuthRepo repo = AuthRepo();
    final response = await repo.loginRequest(
      UserModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (response != null && response.error == null) {

      Get.toNamed(Routes.HOME);
    }else{
      Get.showSnackbar(GetSnackBar(title: "error",message: response?.error.toString(),));
    }
  }
}
