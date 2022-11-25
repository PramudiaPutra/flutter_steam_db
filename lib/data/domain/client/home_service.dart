import 'package:flutter_steam_db/data/domain/repository/home_repository.dart';
import 'package:flutter_steam_db/data/model/home/featured_model.dart';
import 'package:flutter_steam_db/utils/app_constant.dart';
import 'package:http/http.dart';

class HomeServices implements HomeRepository {
  final _endPoint = AppEndpoint();

  @override
  Future<Featured> getFeatured() async {
    final response =
        await get(Uri.https(_endPoint.baseUrl, _endPoint.featured));

    if (response.statusCode == 200) {
      print('status code: ${response.statusCode}');
      return featuredFromJson(response.body);
    } else {
      print('failed status code: ${response.statusCode}');
      return featuredFromJson(response.body);
    }
  }
}
