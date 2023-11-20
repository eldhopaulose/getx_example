import 'package:get/get.dart';
import 'package:getx_example/app/networks/dio/repo/auth_repo.dart';
import 'package:getx_example/app/networks/models/home_details_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  Future<HomeDetailsModel?> fetchData() async {
    final AuthRepo authRepo = AuthRepo();
    final response = await authRepo.homeResponse();

    return response;
  }
}
