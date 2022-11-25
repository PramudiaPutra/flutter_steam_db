import 'package:flutter/cupertino.dart';
import 'package:flutter_steam_db/ui/discount/discount_page.dart';
import 'package:flutter_steam_db/ui/featured/featured_page.dart';
import 'package:flutter_steam_db/utils/app_constant.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Widget> _buildScreen() {
    return [
      const FeaturedPage(),
      const DiscountPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: 'home',
        activeColorPrimary: AppColor().colorLightBlue,
        inactiveColorPrimary: AppColor().colorBlue,
        activeColorSecondary: AppColor().colorWhite,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.archivebox),
        title: 'category',
        activeColorPrimary: AppColor().colorLightBlue,
        inactiveColorPrimary: AppColor().colorBlue,
        activeColorSecondary: AppColor().colorWhite,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBarItems(),
      backgroundColor: AppColor().colorDarkerBlue,
    );
  }
}
