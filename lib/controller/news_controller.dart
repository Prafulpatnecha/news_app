import 'package:get/get.dart';
import 'package:news_app/controller/apihelper.dart';
import 'package:news_app/modal/api_modal.dart';

class NewsController extends GetxController {
  ApiHelper apiHelper = ApiHelper();
  Rx<ApiModal>? apiModalOne;
  Rx<ApiModal>? apiModalTwo;
  Rx<ApiModal>? apiModalThree;
  Rx<ApiModal>? apiModalFour;
  Rx<ApiModal>? apiModalFive;

  Future<Rx<ApiModal>?> dataComesOne() async {
    final jsonOne = await apiHelper.apiCallingOne();
    apiModalOne = ApiModal.fromJson(jsonOne).obs;
    return apiModalOne;
  }
  Future<Rx<ApiModal>?> dataComesTwo()
  async {
    final jsonTwo = await apiHelper.apiCallingTwo();
    apiModalTwo = ApiModal.fromJson(jsonTwo).obs;
    return apiModalTwo;
  }
  Future<Rx<ApiModal>?> dataComesThree()
  async {
    final jsonThree = await apiHelper.apiCallingThree();
    apiModalThree = ApiModal.fromJson(jsonThree).obs;
    return apiModalThree;
  }
  Future<Rx<ApiModal>?> dataComesFour()
  async {
    final jsonFour = await apiHelper.apiCallingFour();
    apiModalFour = ApiModal.fromJson(jsonFour).obs;
    return apiModalFour;
  }
  Future<Rx<ApiModal>?> dataComesFive()
  async {
    final jsonFive = await apiHelper.apiCallingFive();
    apiModalFive = ApiModal.fromJson(jsonFive).obs;
    return apiModalFive;
  }
  NewsController() {
    dataComesOne();
    dataComesTwo();
    dataComesThree();
    dataComesFour();
    dataComesFive();
  }
}
