import 'package:flutter/material.dart';
import 'package:flutter_steam_db/data/domain/controller/home_controller.dart';
import 'package:flutter_steam_db/data/model/home/item_model.dart';
import 'package:flutter_steam_db/ui/widgets/card_item.dart';
import 'package:flutter_steam_db/utils/app_constant.dart';
import 'package:get/get.dart';

class NewReleasePage extends StatelessWidget {
  const NewReleasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Container(
      color: AppColor().colorDarkerBlue,
      child: FutureBuilder(
        future: homeController.getFeaturedCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _buildList(snapshot.data!.newReleases.items);
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          } else {
            return const Center(
              child: Text('no data'),
            );
          }
        },
      ),
    );
  }

  Widget _buildList(List<Items> items) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return CardItem(items[index]);
      }),
      itemCount: items.length,
    );
  }
}
