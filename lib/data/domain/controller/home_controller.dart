import 'package:flutter_steam_db/data/domain/client/home_service.dart';
import 'package:flutter_steam_db/data/model/home/featured_category_model.dart';
import 'package:flutter_steam_db/data/model/home/featured_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _homeService = HomeServices();

  RxBool windows = true.obs;
  RxBool linux = true.obs;
  RxBool mac = true.obs;
  RxBool onCheckedEvent = false.obs;

  Future<Featured> getFeatured() async {
    final result = await _homeService.getFeatured();

    if (result.status == 1) {
      print('result status : ${result.status}');
      return result;
    } else {
      return result;
    }
  }

  Future<FeaturedCategories> getFeaturedCategories() async {
    final result = await _homeService.getFeaturedCategories();

    if (result.status == 1) {
      print('result status : ${result.status}');
      return result;
    } else {
      return result;
    }
  }
}
