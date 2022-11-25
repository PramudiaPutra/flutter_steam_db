import 'package:flutter/material.dart';
import 'package:flutter_steam_db/data/domain/controller/home_controller.dart';
import 'package:flutter_steam_db/data/model/home/item_model.dart';
import 'package:flutter_steam_db/ui/widgets/card_item.dart';
import 'package:flutter_steam_db/utils/app_constant.dart';
import 'package:get/get.dart';

class FeaturedPage extends StatelessWidget {
  const FeaturedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Scaffold(
      body: Container(
        color: AppColor().colorDarkerBlue,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: homeController.windows.value,
                      onChanged: (value) {
                        homeController.windows.value = value!;
                        homeController.onCheckedEvent.value =
                            !homeController.onCheckedEvent.value;
                      },
                    ),
                  ),
                  Text(
                    'windows',
                    style: TextStyle(
                        fontFamily: 'Helvetica', color: AppColor().colorWhite),
                  ),
                  Obx(
                    () => Checkbox(
                      value: homeController.linux.value,
                      onChanged: (value) {
                        homeController.linux.value = value!;
                        homeController.onCheckedEvent.value =
                            !homeController.onCheckedEvent.value;
                      },
                    ),
                  ),
                  Text(
                    'linux',
                    style: TextStyle(
                        fontFamily: 'Helvetica', color: AppColor().colorWhite),
                  ),
                  Obx(
                    () => Checkbox(
                      value: homeController.mac.value,
                      onChanged: (value) {
                        homeController.mac.value = value!;
                        homeController.onCheckedEvent.value =
                            !homeController.onCheckedEvent.value;
                      },
                    ),
                  ),
                  Text(
                    'mac',
                    style: TextStyle(
                        fontFamily: 'Helvetica', color: AppColor().colorWhite),
                  ),
                ],
              ),
              Obx(
                () => !homeController.onCheckedEvent.value
                    ? Expanded(
                        child: FutureBuilder(
                          future: homeController.getFeatured(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                var featuredList = [
                                  ...homeController.windows.value == true
                                      ? snapshot.data!.featuredWin
                                      : <Items>[],
                                  ...homeController.linux.value == true
                                      ? snapshot.data!.featuredLinux
                                      : <Items>[],
                                  ...homeController.mac.value == true
                                      ? snapshot.data!.featuredMac
                                      : <Items>[],
                                  // ...snapshot.data!.featuredLinux,
                                  // ...snapshot.data!.featuredMac
                                ];
                                return _buildList(featuredList);
                              } else {
                                return const Center(
                                    child:
                                        CircularProgressIndicator.adaptive());
                              }
                            } else {
                              return const Center(
                                child: Text('no data'),
                              );
                            }
                          },
                        ),
                      )
                    : Expanded(
                        child: FutureBuilder(
                          future: homeController.getFeatured(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                var featuredList = [
                                  ...homeController.windows.value == true
                                      ? snapshot.data!.featuredWin
                                      : <Items>[],
                                  ...homeController.linux.value == true
                                      ? snapshot.data!.featuredLinux
                                      : <Items>[],
                                  ...homeController.mac.value == true
                                      ? snapshot.data!.featuredMac
                                      : <Items>[],
                                  // ...snapshot.data!.featuredLinux,
                                  // ...snapshot.data!.featuredMac
                                ];
                                return _buildList(featuredList);
                              } else {
                                return const Center(
                                    child:
                                        CircularProgressIndicator.adaptive());
                              }
                            } else {
                              return const Center(
                                child: Text('no data'),
                              );
                            }
                          },
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(List<Items> platform) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return CardItem(platform[index]);
      }),
      itemCount: platform.length,
    );
  }
}
