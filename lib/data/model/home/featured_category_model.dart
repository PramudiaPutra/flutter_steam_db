import 'dart:convert';

FeaturedCategories featuredCategoriesFromJson(String str) =>
    FeaturedCategories.fromJson(json.decode(str));

String featuredCategoryToJson(FeaturedCategories data) =>
    json.encode(data.toJson());

class FeaturedCategories {
  FeaturedCategories({
    required this.specials,
    required this.comingSoon,
    required this.topSellers,
    required this.newReleases,
    required this.genres,
    required this.trailerslideshow,
    required this.status,
  });

  ComingSoon specials;
  ComingSoon comingSoon;
  ComingSoon topSellers;
  ComingSoon newReleases;
  Genres genres;
  Genres trailerslideshow;
  int status;

  factory FeaturedCategories.fromJson(Map<String, dynamic> json) =>
      FeaturedCategories(
        specials: ComingSoon.fromJson(json["specials"]),
        comingSoon: ComingSoon.fromJson(json["coming_soon"]),
        topSellers: ComingSoon.fromJson(json["top_sellers"]),
        newReleases: ComingSoon.fromJson(json["new_releases"]),
        genres: Genres.fromJson(json["genres"]),
        trailerslideshow: Genres.fromJson(json["trailerslideshow"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "specials": specials.toJson(),
        "coming_soon": comingSoon.toJson(),
        "top_sellers": topSellers.toJson(),
        "new_releases": newReleases.toJson(),
        "genres": genres.toJson(),
        "trailerslideshow": trailerslideshow.toJson(),
        "status": status,
      };
}

class ComingSoon {
  ComingSoon({
    required this.id,
    required this.name,
    required this.items,
  });

  String id;
  String name;
  List<Item> items;

  factory ComingSoon.fromJson(Map<String, dynamic> json) => ComingSoon(
        id: json["id"],
        name: json["name"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.type,
    required this.name,
    this.discounted,
    this.discountPercent,
    this.originalPrice,
    this.finalPrice,
    this.currency,
    this.largeCapsuleImage,
    this.smallCapsuleImage,
    this.windowsAvailable,
    this.macAvailable,
    this.linuxAvailable,
    this.streamingvideoAvailable,
    this.headerImage,
    this.controllerSupport,
    this.discountExpiration,
    this.headline,
  });

  int? id;
  int? type;
  String name;
  bool? discounted;
  int? discountPercent;
  int? originalPrice;
  int? finalPrice;
  String? currency;
  String? largeCapsuleImage;
  String? smallCapsuleImage;
  bool? windowsAvailable;
  bool? macAvailable;
  bool? linuxAvailable;
  bool? streamingvideoAvailable;
  String? headerImage;
  String? controllerSupport;
  int? discountExpiration;
  String? headline;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        discounted: json["discounted"],
        discountPercent: json["discount_percent"],
        originalPrice:
            json["original_price"] == null ? null : json["original_price"],
        finalPrice: json["final_price"],
        currency: json["currency"],
        largeCapsuleImage: json["large_capsule_image"],
        smallCapsuleImage: json["small_capsule_image"],
        windowsAvailable: json["windows_available"],
        macAvailable: json["mac_available"],
        linuxAvailable: json["linux_available"],
        streamingvideoAvailable: json["streamingvideo_available"],
        headerImage: json["header_image"],
        controllerSupport: json["controller_support"] == null
            ? null
            : json["controller_support"],
        discountExpiration: json["discount_expiration"] == null
            ? null
            : json["discount_expiration"],
        headline: json["headline"] == null ? null : json["headline"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "discounted": discounted,
        "discount_percent": discountPercent,
        "original_price": originalPrice == null ? null : originalPrice,
        "final_price": finalPrice,
        "currency": currency,
        "large_capsule_image": largeCapsuleImage,
        "small_capsule_image": smallCapsuleImage,
        "windows_available": windowsAvailable,
        "mac_available": macAvailable,
        "linux_available": linuxAvailable,
        "streamingvideo_available": streamingvideoAvailable,
        "header_image": headerImage,
        "controller_support":
            controllerSupport == null ? null : controllerSupport,
        "discount_expiration":
            discountExpiration == null ? null : discountExpiration,
        "headline": headline == null ? null : headline,
      };
}

class Genres {
  Genres({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
