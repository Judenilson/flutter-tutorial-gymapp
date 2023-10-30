class Exercise {
  String id;
  String name;
  String exercise;
  String toDo;
  String? urlImage;

  Exercise({
    required this.id,
    required this.name,
    required this.exercise,
    required this.toDo,
  });

  Exercise.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        exercise = map["exercise"],
        toDo = map["toDo"],
        urlImage = map["urlImage"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "exercise": exercise,
      "toDo": toDo,
      "urlImage": urlImage,
    };
  }
}
