class AnimalModel {
  final String id;
  final String name;
  final String race;
  final String weight;
  final String height;

  AnimalModel({required this.id, required this.name, required this.race, required this.weight, required this.height});

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
        id: json['id'],
        name: json['name'],
        race: json['race'],
        weight: json['weight'],
        height: json['height']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'race': race,
      'weight': weight,
      'height': height
    };
  }
}