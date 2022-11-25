import 'dart:convert';
import 'item_model.dart';

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
  List<Items> featuredWin;
  List<Items> featuredMac;
  List<Items> featuredLinux;
  String layout;
  int status;

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
        largeCapsules: List<dynamic>.from(json["large_capsules"].map((x) => x)),
        featuredWin: List<Items>.from(
            json["featured_win"].map((x) => Items.fromJson(x))),
        featuredMac: List<Items>.from(
            json["featured_mac"].map((x) => Items.fromJson(x))),
        featuredLinux: List<Items>.from(
            json["featured_linux"].map((x) => Items.fromJson(x))),
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
