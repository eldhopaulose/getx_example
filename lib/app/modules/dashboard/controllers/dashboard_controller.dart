import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  late String name;
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    name = args['Name'];
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
