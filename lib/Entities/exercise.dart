// To parse this JSON data, do
//
//     final Exercise = ExerciseFromJson(jsonString);

import 'dart:convert';

List<Exercise> exerciseFromJson(String str) => List<Exercise>.from(json.decode(str).map((x) => Exercise.fromJson(x)));

String exerciseToJson(List<Exercise> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exercise {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? id;
  String? name;
  String? target;
  List<String>? secondaryMuscles;
  List<String>? instructions;

  Exercise({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.target,
    this.secondaryMuscles,
    this.instructions,
  });

  Exercise copyWith({
    String? bodyPart,
    String? equipment,
    String? gifUrl,
    String? id,
    String? name,
    String? target,
    List<String>? secondaryMuscles,
    List<String>? instructions,
  }) =>
      Exercise(
        bodyPart: bodyPart ?? this.bodyPart,
        equipment: equipment ?? this.equipment,
        gifUrl: gifUrl ?? this.gifUrl,
        id: id ?? this.id,
        name: name ?? this.name,
        target: target ?? this.target,
        secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
        instructions: instructions ?? this.instructions,
      );

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    bodyPart: json["bodyPart"],
    equipment: json["equipment"],
    gifUrl: json["gifUrl"],
    id: json["id"],
    name: json["name"],
    target: json["target"],
    secondaryMuscles: List<String>.from(json["secondaryMuscles"].map((x) => x)),
    instructions: List<String>.from(json["instructions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "bodyPart": bodyPart,
    "equipment": equipment,
    "gifUrl": gifUrl,
    "id": id,
    "name": name,
    "target": target,
    "secondaryMuscles": List<dynamic>.from(secondaryMuscles!.map((x) => x)),
    "instructions": List<dynamic>.from(instructions!.map((x) => x)),
  };

  @override
  String toString() {
    return 'Exercise{'
        'bodyPart: $bodyPart, '
        'equipment: $equipment, '
        'gifUrl: $gifUrl, '
        'id: $id, '
        'name: $name, '
        'target: $target, '
        'secondaryMuscles: $secondaryMuscles, '
        'instructions: $instructions'
        '}';
  }

}