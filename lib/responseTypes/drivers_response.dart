class DriversResponse {
  final List<Driver> content;

  DriversResponse({required this.content});

  factory DriversResponse.fromJson(Map<String, dynamic> json) {
    return DriversResponse(
      content: (json['content'] as List)
          .map((driverJson) => Driver.fromJson(driverJson))
          .toList(),
    );
  }
}

class Driver {
  final String? id;
  final String? uid;
  final String? title;
  final String? articleId;
  final String? name;
  final String? car;
  final Country country;
  final String? type;
  final String? team;
  final String? championship;
  final String? classType;
  final String? manufacturer;
  final List<Image> images;

  Driver({
    required this.id,
    required this.uid,
    required this.title,
    required this.articleId,
    required this.name,
    required this.car,
    required this.country,
    required this.type,
    required this.team,
    required this.championship,
    required this.classType,
    required this.manufacturer,
    required this.images,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      uid: json['uid'],
      title: json['title'],
      articleId: json['articleId'],
      name: json['name'],
      car: json['car'],
      country: Country.fromJson(json['country']),
      type: json['type'],
      team: json['team'],
      championship: json['championship'],
      classType: json['class'],
      manufacturer: json['manufacturer'],
      images: (json['images'] as List)
          .map((imageJson) => Image.fromJson(imageJson))
          .toList(),
    );
  }
}

class Country {
  final String name;
  final List<Flag> flag;

  Country({required this.name, required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      flag: (json['flag'] as List)
          .map((flagJson) => Flag.fromJson(flagJson))
          .toList(),
    );
  }
}

class Flag {
  final String url;
  final int height;
  final int width;
  final String type;

  Flag({required this.url, required this.height, required this.width, required this.type});

  factory Flag.fromJson(Map<String, dynamic> json) {
    return Flag(
      url: json['url'],
      height: json['height'],
      width: json['width'],
      type: json['type'],
    );
  }
}

class Image {
  final String url;
  final int height;
  final int width;
  final String type;

  Image({required this.url, required this.height, required this.width, required this.type});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json['url'],
      height: json['height'],
      width: json['width'],
      type: json['type'],
    );
  }
}
