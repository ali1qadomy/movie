
class MovieTrailler {
  MovieTrailler({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  Iso6391? iso6391;
  Iso31661? iso31661;
  String? name;
  String? key;
  Site? site;
  int? size;
  Type? type;
  bool? official;
  DateTime? publishedAt;
  String? id;

  factory MovieTrailler.fromJson(Map<String, dynamic> json) => MovieTrailler(
    iso6391: iso6391Values.map[json["iso_639_1"]],
    iso31661: iso31661Values.map[json["iso_3166_1"]],
    name: json["name"],
    key: json["key"],
    site: siteValues.map[json["site"]],
    size: json["size"],
    type: typeValues.map[json["type"]],
    official: json["official"],
    id: json["id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391Values.reverse[iso6391],
    "iso_3166_1": iso31661Values.reverse[iso31661],
    "name": name,
    "key": key,
    "site": siteValues.reverse[site],
    "size": size,
    "type": typeValues.reverse[type],
    "official": official,
    "published_at": publishedAt!.toIso8601String(),
    "id": id,
  };
}

enum Iso31661 { US }

final iso31661Values = EnumValues({"US": Iso31661.US});

enum Iso6391 { EN }

final iso6391Values = EnumValues({"en": Iso6391.EN});

enum Site { YOU_TUBE }

final siteValues = EnumValues({"YouTube": Site.YOU_TUBE});

enum Type { FEATURETTE, CLIP, TRAILER, BEHIND_THE_SCENES }

final typeValues = EnumValues({
  "Behind the Scenes": Type.BEHIND_THE_SCENES,
  "Clip": Type.CLIP,
  "Featurette": Type.FEATURETTE,
  "Trailer": Type.TRAILER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
