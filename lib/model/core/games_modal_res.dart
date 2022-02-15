class GetGames {
  final int? id;
  final String? name;

  GetGames({
    this.id,
    this.name,
  });

  GetGames.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class ChooseList {
  final int? id;
  final String? name;
  final String? image;

  ChooseList({
    this.id,
    this.name,
    this.image,
  });

  ChooseList.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        image = json['image'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};
}

class GameDetails {
  final int? id;
  final Cover? cover;
  final int? firstReleaseDate;
  final String? name;
  final num? rating;
  bool? fav = false;
  GameDetails(
      {this.id,
      this.cover,
      this.firstReleaseDate,
      this.name,
      this.rating,
      bool fav = false});

  GameDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        cover = (json['cover'] as Map<String, dynamic>?) != null
            ? Cover.fromJson(json['cover'] as Map<String, dynamic>)
            : null,
        firstReleaseDate = json['first_release_date'] as int?,
        name = json['name'] as String?,
        rating = json['rating'] as num?,
        fav = false;

  Map<String, dynamic> toJson() => {
        'id': id,
        'cover': cover?.toJson(),
        'first_release_date': firstReleaseDate,
        'name': name,
        'rating': rating,
        'fav': fav
      };
}

class Cover {
  final int? id;
  final bool? alphaChannel;
  final bool? animated;
  final int? game;
  final int? height;
  final String? imageId;
  final String? url;
  final int? width;
  final String? checksum;

  Cover({
    this.id,
    this.alphaChannel,
    this.animated,
    this.game,
    this.height,
    this.imageId,
    this.url,
    this.width,
    this.checksum,
  });

  Cover.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        alphaChannel = json['alpha_channel'] as bool?,
        animated = json['animated'] as bool?,
        game = json['game'] as int?,
        height = json['height'] as int?,
        imageId = json['image_id'] as String?,
        url = json['url'] as String?,
        width = json['width'] as int?,
        checksum = json['checksum'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'alpha_channel': alphaChannel,
        'animated': animated,
        'game': game,
        'height': height,
        'image_id': imageId,
        'url': url,
        'width': width,
        'checksum': checksum
      };
}
