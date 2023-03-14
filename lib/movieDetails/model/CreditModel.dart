import 'dart:convert';

import 'dart:convert';
/// adult : false
/// gender : 2
/// id : 1253360
/// known_for : [{"backdrop_path":"/9ijMGlJKqcslswWUzTEwScm82Gs.jpg","first_air_date":"2019-11-12","genre_ids":[10765,10759,18],"id":82856,"media_type":"tv","name":"The Mandalorian","origin_country":["US"],"original_language":"en","original_name":"The Mandalorian","overview":"After the fall of the Galactic Empire, lawlessness has spread throughout the galaxy. A lone gunfighter makes his way through the outer reaches, earning his keep as a bounty hunter.","poster_path":"/sWgBv7LV2PRoQgkxwlibdGXKz1S.jpg","vote_average":8.5,"vote_count":8308},{"adult":false,"backdrop_path":"/z7noaCJ4KtmhwHw7QcNtnMMo4Qy.jpg","genre_ids":[28,53,80],"id":345887,"media_type":"movie","original_language":"en","original_title":"The Equalizer 2","overview":"Robert McCall, who serves an unflinching justice for the exploited and oppressed, embarks on a relentless, globe-trotting quest for vengeance when a long-time girl friend is murdered.","poster_path":"/cQvc9N6JiMVKqol3wcYrGshsIdZ.jpg","release_date":"2018-07-19","title":"The Equalizer 2","video":false,"vote_average":6.7,"vote_count":4260},{"adult":false,"backdrop_path":"/yzpCv8CCWondN7O5au1KGiqnC3A.jpg","genre_ids":[28,12,14],"id":464052,"media_type":"movie","original_language":"en","original_title":"Wonder Woman 1984","overview":"A botched store robbery places Wonder Woman in a global battle against a powerful and mysterious ancient force that puts her powers in jeopardy.","poster_path":"/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg","release_date":"2020-12-16","title":"Wonder Woman 1984","video":false,"vote_average":6.5,"vote_count":7378}]
/// known_for_department : "Acting"
/// name : "Pedro Pascal"
/// popularity : 280.068
/// profile_path : "/hoP3vT6OBMNCUFTqlTDcd2X3y77.jpg"

CreditModel actorsModelFromJson(String str) => CreditModel.fromJson(json.decode(str));
String actorsModelToJson(CreditModel data) => json.encode(data.toJson());
class CreditModel {
  CreditModel({
    bool? adult,
    int? gender,
    int? id,
    List<KnownFor>? knownFor,
    String? knownForDepartment,
    String? name,
    double? popularity,
    String? profilePath,}){
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownFor = knownFor;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _popularity = popularity;
    _profilePath = profilePath;
  }

  CreditModel.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    if (json['known_for'] != null) {
      _knownFor = [];
      json['known_for'].forEach((v) {
        _knownFor?.add(KnownFor.fromJson(v));
      });
    }
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
  }
  bool? _adult;
  int? _gender;
  int? _id;
  List<KnownFor>? _knownFor;
  String? _knownForDepartment;
  String? _name;
  double? _popularity;
  String? _profilePath;
  CreditModel copyWith({  bool? adult,
    int? gender,
    int? id,
    List<KnownFor>? knownFor,
    String? knownForDepartment,
    String? name,
    double? popularity,
    String? profilePath,
  }) => CreditModel(  adult: adult ?? _adult,
    gender: gender ?? _gender,
    id: id ?? _id,
    knownFor: knownFor ?? _knownFor,
    knownForDepartment: knownForDepartment ?? _knownForDepartment,
    name: name ?? _name,
    popularity: popularity ?? _popularity,
    profilePath: profilePath ?? _profilePath,
  );
  bool? get adult => _adult;
  int? get gender => _gender;
  int? get id => _id;
  List<KnownFor>? get knownFor => _knownFor;
  String? get knownForDepartment => _knownForDepartment;
  String? get name => _name;
  double? get popularity => _popularity;
  String? get profilePath => _profilePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['gender'] = _gender;
    map['id'] = _id;
    if (_knownFor != null) {
      map['known_for'] = _knownFor?.map((v) => v.toJson()).toList();
    }
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    return map;
  }

}


KnownFor knownForFromJson(String str) => KnownFor.fromJson(json.decode(str));
String knownForToJson(KnownFor data) => json.encode(data.toJson());
class KnownFor {
  KnownFor({
    String? backdropPath,
    String? firstAirDate,
    List<num>? genreIds,
    int? id,
    String? mediaType,
    String? name,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    String? posterPath,
    num? voteAverage,
    num? voteCount,}){
    _backdropPath = backdropPath;
    _firstAirDate = firstAirDate;
    _genreIds = genreIds;
    _id = id;
    _mediaType = mediaType;
    _name = name;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _posterPath = posterPath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  KnownFor.fromJson(dynamic json) {
    _backdropPath = json['backdrop_path'];
    _firstAirDate = json['first_air_date'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _id = json['id'];
    _mediaType = json['media_type'];
    _name = json['name'];
    _originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    _originalLanguage = json['original_language'];
    _originalName = json['original_name'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  String? _backdropPath;
  String? _firstAirDate;
  List<num>? _genreIds;
  int? _id;
  String? _mediaType;
  String? _name;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  String? _posterPath;
  num? _voteAverage;
  num? _voteCount;
  KnownFor copyWith({  String? backdropPath,
    String? firstAirDate,
    List<num>? genreIds,
    int? id,
    String? mediaType,
    String? name,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    String? posterPath,
    num? voteAverage,
    num? voteCount,
  }) => KnownFor(  backdropPath: backdropPath ?? _backdropPath,
    firstAirDate: firstAirDate ?? _firstAirDate,
    genreIds: genreIds ?? _genreIds,
    id: id ?? _id,
    mediaType: mediaType ?? _mediaType,
    name: name ?? _name,
    originCountry: originCountry ?? _originCountry,
    originalLanguage: originalLanguage ?? _originalLanguage,
    originalName: originalName ?? _originalName,
    overview: overview ?? _overview,
    posterPath: posterPath ?? _posterPath,
    voteAverage: voteAverage ?? _voteAverage,
    voteCount: voteCount ?? _voteCount,
  );
  String? get backdropPath => _backdropPath;
  String? get firstAirDate => _firstAirDate;
  List<num>? get genreIds => _genreIds;
  num? get id => _id;
  String? get mediaType => _mediaType;
  String? get name => _name;
  List<String>? get originCountry => _originCountry;
  String? get originalLanguage => _originalLanguage;
  String? get originalName => _originalName;
  String? get overview => _overview;
  String? get posterPath => _posterPath;
  num? get voteAverage => _voteAverage;
  num? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = _backdropPath;
    map['first_air_date'] = _firstAirDate;
    map['genre_ids'] = _genreIds;
    map['id'] = _id;
    map['media_type'] = _mediaType;
    map['name'] = _name;
    map['origin_country'] = _originCountry;
    map['original_language'] = _originalLanguage;
    map['original_name'] = _originalName;
    map['overview'] = _overview;
    map['poster_path'] = _posterPath;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}