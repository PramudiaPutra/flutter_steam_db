import 'package:flutter/material.dart';
import 'package:flutter_steam_db/data/domain/controller/home_controller.dart';
import 'package:flutter_steam_db/data/model/home/featured_model.dart';
import 'package:flutter_steam_db/ui/widgets/card_item.dart';
import 'package:flutter_steam_db/utils/app_constant.dart';
import 'package:get/get.dart';

class FeaturedPage extends StatelessWidget {
  const FeaturedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Container(
      color: AppColor().colorDarkerBlue,
      child: FutureBuilder(
        future: homeController.getFeatured(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.done) {
              var featuredList = [
                ...snapshot.data!.featuredWin,
                ...snapshot.data!.featuredLinux,
                ...snapshot.data!.featuredMac
              ];
              return _buildList(featuredList);
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

  Widget _buildList(List<FeaturedPlatform>? platform) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return CardItem(platform[index]);
      }),
      itemCount: platform!.length,
    );
  }
}
