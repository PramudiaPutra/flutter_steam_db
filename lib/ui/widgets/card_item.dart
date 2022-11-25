import 'package:flutter/material.dart';
import 'package:flutter_steam_db/data/model/home/item_model.dart';
import 'package:flutter_steam_db/utils/app_constant.dart';
import 'package:money2/money2.dart';

class CardItem extends StatelessWidget {
  CardItem(Items platform, {super.key}) : _platform = platform;
  final Items _platform;
  final color = AppColor();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.colorBlue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _platform.smallCapsuleImage!,
              scale: 1.5,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/icons/steam.png',
                scale: 15,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      _platform.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: color.colorWhite),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _platformContainer(),
                ],
              ),
            ),
            _priceContainer()
          ],
        ),
      ),
    );
  }

  Widget _platformContainer() {
    return Flexible(
      child: SizedBox(
        height: 10,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            _platform.windowsAvailable == true
                ? ImageIcon(
                    const AssetImage('assets/icons/windows.png'),
                    color: color.colorWhite,
                  )
                : Container(),
            _platform.linuxAvailable == true
                ? ImageIcon(
                    const AssetImage('assets/icons/linux.png'),
                    color: color.colorWhite,
                  )
                : Container(),
            _platform.macAvailable == true
                ? ImageIcon(
                    const AssetImage('assets/icons/mac.png'),
                    color: color.colorWhite,
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _priceContainer() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(2),
        color: AppColor().colorDarkerBlue,
        child: Row(
          children: [
            _platform.discounted == true
                ? Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor().colorDarkGreen,
                    ),
                    child: Text(
                      '${_platform.discountPercent} %',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        color: AppColor().colorGreen,
                      ),
                    ),
                  )
                : Container(),
            _platform.originalPrice == null
                ? Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor().colorDarkGreen,
                    ),
                    child: Text(
                      'Free',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        color: AppColor().colorGreen,
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(width: 4),
            Column(
              children: [
                _platform.discounted
                    ? Text(
                        '${_moneyFormatter(_platform.originalPrice)}',
                        // '${priceFormat.parse('${_platform.originalPrice}')}',
                        // 'Rp ${_platform.originalPrice}',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          decoration: TextDecoration.lineThrough,
                          color: AppColor().colorWhite.withOpacity(0.5),
                          fontSize: 12,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 4),
                Text(
                  '${_moneyFormatter(_platform.finalPrice)}',
                  // '${priceFormat.parse('${_platform.originalPrice}')}',
                  // 'Rp ${_platform.originalPrice}',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    color: AppColor().colorWhite,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _moneyFormatter(int? price) {
    if (price != null) {
      final Currency idr = Currency.create(
        'IDR',
        2,
        symbol: 'Rp ',
      );

      Money formatPrice = Money.fromIntWithCurrency(price, idr);
      return formatPrice.toString();
    }
  }
}
