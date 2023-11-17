import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Obx(()=>Text(
          'HomeView is working ${controller.count.value}',
          style: const TextStyle(fontSize: 20),
        )),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // controller.increment();
          Get.toNamed(Routes.DASHBOARD , arguments: {"Name":"Eldho"});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
