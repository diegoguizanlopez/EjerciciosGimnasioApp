import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gym_app/Entities/exercise.dart';
import 'package:http/http.dart' as http;

class ExcerciseData with ChangeNotifier {
  List<Excercise> excerciseList = [];

  Map<String, List<String>> bodyPartsE = {
    "back": ["back"],
    "cardio": ["cardio"],
    "chest": ["chest"],
    "arms": ["lower arms", "upper arms", "shoulders"],
    "legs": ["lower legs", "upper legs"],
    "neck": ["neck"],
    "waist": ["waist"]
  };
  Map<String, List<String>> bodyPartsS = {
    "espalda": ["espalda"],
    "cardio": ["cardio"],
    "pecho": ["pecho"],
    "brazos": ["antebrazos", "brazos superiores", "hombros"],
    "piernas": ["piernas inferiores", "piernas superiores"],
    "cuello": ["cuello"],
    "cintura": ["cintura"]
  };

  Map<String, List<String>> targetList = {
    "back": [
      "delts",
      "lats",
      "spine",
      "upper back",
      "serratus anterior",
      "spine"
    ],
    "cardio": ["cardiovascular system"],
    "chest": ["abs", "pectorals"],
    "arms": ["forearms", "biceps", "triceps"],
    "legs": ["abductors", "calves", "hamstrings", "quads"],
    "neck": ["levator scapulae", "traps"],
    "waist": ["glutes"],
  };
  Map<String, List<String>> targetListS = {
    "espalda": [
      "deltoides",
      "dorsales",
      "columna vertebral",
      "espalda alta",
      "serrato anterior",
      "columna vertebral"
    ],
    "cardio": ["sistema cardiovascular"],
    "pecho": ["abdominales", "pectorales"],
    "brazos": ["antebrazos", "bíceps", "tríceps"],
    "piernas": ["abductores", "gemelos", "isquiotibiales", "cuádriceps"],
    "cuello": ["elevador de la escápula", "trapecios"],
    "cintura": ["glúteos"],
  };

  List<String> equipmentListE = [
    "assisted",
    "band",
    "barbell",
    "body weight",
    "bosu ball",
    "cable",
    "dumbbell",
    "elliptical machine",
    "ez barbell",
    "hammer",
    "kettlebell",
    "leverage machine",
    "medicine ball",
    "olympic barbell",
    "resistance band",
    "roller",
    "rope",
    "skierg machine",
    "sled machine",
    "smith machine",
    "stability ball",
    "stationary bike",
    "stepmill machine",
    "tire",
    "trap bar",
    "upper body ergometer",
    "weighted",
    "wheel roller"
  ];

  List<String> equipmentListS = [
    "asistido",
    "banda",
    "barra de pesas",
    "peso corporal",
    "pelota Bosu",
    "cable",
    "pesa",
    "máquina elíptica",
    "barra EZ",
    "martillo",
    "pesa rusa",
    "máquina de palanca",
    "balón medicinal",
    "barra olímpica",
    "banda de resistencia",
    "rodillo",
    "cuerda",
    "máquina de esquí de fondo",
    "máquina de trineo",
    "máquina Smith",
    "pelota de estabilidad",
    "bicicleta estática",
    "máquina StepMill",
    "neumático",
    "barra trapezoidal",
    "ergómetro de cuerpo superior",
    "con peso",
    "rodillo de rueda"
  ];

  final baseURL = "https://exercisedb.p.rapidapi.com/exercises?limit=0";
  final x_rapid_host = "exercisedb.p.rapidapi.com";
  final x_rapid_key = dotenv.env['X_RAPID_KEY'];

  Future<List<Excercise>> getListExcercise(String target) async {
    if (excerciseList.isEmpty) {
      var response = await http.get(Uri.parse(baseURL), headers: {
        "x-rapidapi-host": x_rapid_host,
        "x-rapidapi-key": x_rapid_key!
      });
      try {
        excerciseList =
            excerciseFromJson(json.encode(await json.decode(response.body)));
      } catch (e) {
        print(e);
      }
    }
    var list = excerciseList
        .where(
          (element) => element.target == target,
        )
        .toList();
    return list;
  }

  String traductor(bool body, bool toSpanish, String value, bool checkKeys) {
    var bodyE = bodyPartsE.keys.toList();
    var bodyS = bodyPartsS.keys.toList();
    var tarE = targetList.keys.toList();
    var tarS = targetListS.keys.toList();
    if (toSpanish) {
      if (checkKeys) {
        var index = bodyE.indexOf(value);
        if (index != -1) {
          return bodyS[index];
        }
      }
      return body
          ? bodyS[bodyE.indexOf(bodyPartsE.entries
              .firstWhere(
                (entry) => entry.value.contains(value),
              )
              .key)]
          : tarS[tarE.indexOf(targetList.entries
              .firstWhere(
                (entry) => entry.value.contains(value),
              )
              .key)];
    }
    if (checkKeys) {
      var index = bodyS.indexOf(value);
      if (index != -1) {
        return bodyE[index];
      }
    }
    return body
        ? bodyE[bodyS.indexOf(bodyPartsS.entries
            .firstWhere(
              (entry) => entry.value.contains(value),
            )
            .key)]
        : tarE[tarS.indexOf(targetListS.entries
            .firstWhere(
              (entry) => entry.value.contains(value),
            )
            .key)];
  }

  String traductValue(bool body, bool toSpanish, String value) {
    var bodyEValues = bodyPartsE.values.toList().expand((x) => x).toList();
    var bodySValues = bodyPartsS.values.toList().expand((x) => x).toList();
    var tarEValues = targetList.values.toList().expand((x) => x).toList();
    var tarSValues = targetListS.values.toList().expand((x) => x).toList();
    if (toSpanish) {
      return body
          ? bodySValues[bodyEValues.indexOf(value)]
          : tarSValues[tarEValues.indexOf(value)];
    }
    return body
        ? bodyEValues[bodySValues.indexOf(value)]
        : tarEValues[tarSValues.indexOf(value)];
  }

  String traductEquipment(bool toSpanish, String value) {
    if (toSpanish) {
      return equipmentListS[equipmentListE.indexOf(value)];
    }
    return equipmentListE[equipmentListS.indexOf(value)];
  }
}
