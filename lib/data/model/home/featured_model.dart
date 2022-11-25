import 'dart:convert';

// To parse this JSON data, do
//
//     final featured = featuredFromJson(jsonString);

import 'dart:convert';

Featured featuredFromJson(String str) => Featured.fromJson(json.decode(str));

String featuredToJson(Featured data) => json.encode(data.toJson());

class Featured {
  Featured({
    required this.largeCapsules,
    required this.featuredWin,
    required this.featuredMac,
    required this.featuredLinux,
    required this.layout,
    required this.status,
  });

  List<dynamic> largeCapsules;
  List<FeaturedPlatform> featuredWin;
  List<FeaturedPlatform> featuredMac;
  List<FeaturedPlatform> featuredLinux;
  String layout;
  int status;

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
        largeCapsules: List<dynamic>.from(json["large_capsules"].map((x) => x)),
        featuredWin: List<FeaturedPlatform>.from(
            json["featured_win"].map((x) => FeaturedPlatform.fromJson(x))),
        featuredMac: List<FeaturedPlatform>.from(
            json["featured_mac"].map((x) => FeaturedPlatform.fromJson(x))),
        featuredLinux: List<FeaturedPlatform>.from(
            json["featured_linux"].map((x) => FeaturedPlatform.fromJson(x))),
        layout: json["layout"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "large_capsules": List<dynamic>.from(largeCapsules.map((x) => x)),
        "featured_win": List<dynamic>.from(featuredWin.map((x) => x.toJson())),
        "featured_mac": List<dynamic>.from(featuredMac.map((x) => x.toJson())),
        "featured_linux":
            List<dynamic>.from(featuredLinux.map((x) => x.toJson())),
        "layout": layout,
        "status": status,
      };
}

class FeaturedPlatform {
  FeaturedPlatform({
    required this.id,
    required this.type,
    required this.name,
    required this.discounted,
    this.discountPercent,
    this.originalPrice,
    this.finalPrice,
    this.currency,
    this.largeCapsuleImage,
    this.smallCapsuleImage,
    required this.windowsAvailable,
    required this.macAvailable,
    required this.linuxAvailable,
    this.streamingvideoAvailable,
    this.headerImage,
    this.controllerSupport,
    this.discountExpiration,
  });

  int id;
  int type;
  String name;
  bool discounted;
  int? discountPercent;
  int? originalPrice;
  int? finalPrice;
  String? currency;
  String? largeCapsuleImage;
  String? smallCapsuleImage;
  bool windowsAvailable;
  bool macAvailable;
  bool linuxAvailable;
  bool? streamingvideoAvailable;
  String? headerImage;
  String? controllerSupport;
  int? discountExpiration;

  factory FeaturedPlatform.fromJson(Map<String, dynamic> json) =>
      FeaturedPlatform(
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
      };
}
