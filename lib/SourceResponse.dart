class Movie {
  final String title;
  final String backDropPath;
  final String overview;
  final String posterPath;
  final String date;
  final int id;

  Movie(
      {required this.title,
      required this.backDropPath,
      required this.overview,
      required this.posterPath,
      required this.date,
        required this.id});

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      backDropPath: map['backdrop_path'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      date: map['release_date'],
      id: map['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backDropPath': backDropPath,
      'overview': overview,
      'posterPath': posterPath,
      'release_date': date,
      'id': id,
    };
  }
}

class search {
  final String overview;
  final String title;
  final String originaltitle;
  final String date;
  //final String posterPath;



  search({

    required this.overview,
    required this.title,
    required this.originaltitle,
    required this.date,
   // required this.posterPath,

  }
      );

  factory search.fromMap(Map<String, dynamic> map) {
    return search(
      overview: map['overview'],
      title: map['title'],
      originaltitle: map['original_title'],
      date: map['release_date'],
      //posterPath: map['poster_path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'overview': overview,
      'title': title,
      'original_title':originaltitle,
      'release_date': date,
      // 'poster_Path': posterPath,

    };
  }
}

class Gener {
  final int id;
  final String name;

  Gener(
      {required this.id,
        required this.name,
      });

  factory Gener.fromMap(Map<String, dynamic> map) {
    return Gener(
      id: map['id'],
      name: map['name'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}


