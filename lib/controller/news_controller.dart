import 'dart:math';

import 'package:get/get.dart';
import 'package:news_app/controller/apihelper.dart';
import 'package:news_app/modal/api_modal.dart';

class NewsController extends GetxController {
  RxInt index = 0.obs;
  Rx<ApiModal>? apiView;
  Rx<ApiModal>? apiOne;
  Rx<ApiModal>? apiTwo;
  Rx<ApiModal>? apiThree;
  Rx<ApiModal>? apiFour;
  Rx<ApiModal>? apiFive;
  dynamic apiHelper = ApiHelper().obs;
  Rx<ApiModal>? apiModalOne;
  Rx<ApiModal>? apiModalTwo;
  Rx<ApiModal>? apiModalThree;
  Rx<ApiModal>? apiModalFour;
  Rx<ApiModal>? apiModalFive;

  Future<Rx<ApiModal>?> dataComesOne() async {
    final jsonOne = await apiHelper.value.apiCallingOne();
    apiModalOne = ApiModal.fromJson(jsonOne).obs;
    // update();
    return apiModalOne;
  }
  Future<Rx<ApiModal>?> dataComesTwo()
  async {
    final json;
    int value = 0 ;
    Random random =Random();
    value = random.nextInt(4);
    if(value==0)
      {
        json = await apiHelper.value.apiCallingTwo();
      }
    else if(value==1)
      {
        json = await apiHelper.value.apiCallingThree();
      }
    else if(value==2)
      {
        json = await apiHelper.value.apiCallingFour();
      }
    else{
        json = await apiHelper.value.apiCallingFive();
    }

    apiModalTwo = ApiModal.fromJson(json).obs;
    return apiModalTwo;
  }
  Future<Rx<ApiModal>?> dataComesThree()
  async {
    final jsonThree = await apiHelper.value.apiCallingThree();
    apiModalThree = ApiModal.fromJson(jsonThree).obs;
    return apiModalThree;
  }
  Future<Rx<ApiModal>?> dataComesFour()
  async {
    final jsonFour = await apiHelper.value.apiCallingFour();
    apiModalFour = ApiModal.fromJson(jsonFour).obs;
    return apiModalFour;
  }
  Future<Rx<ApiModal>?> dataComesFive()
  async {
    final jsonFive = await apiHelper.value.apiCallingFive();
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
