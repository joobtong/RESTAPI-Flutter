class Movies {
  String name;
  String background;
  String release_date;
  Movies({this.name,this.background,this.release_date});

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      name: json["name"],
      background: json["background"],
      release_date: json["release_date"]
    );
  }

}