import 'dart:convert';
import 'package:flutter_steam_db/data/model/home/item_model.dart';

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
  List<Items> items;

  factory ComingSoon.fromJson(Map<String, dynamic> json) => ComingSoon(
        id: json["id"],
        name: json["name"],
        items: List<Items>.from(json["items"].map((x) => Items.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
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
