import 'package:flutter/cupertino.dart';
import 'package:gym_app/Entities/exercise.dart';
import 'package:gym_app/Pages/exercise_page.dart';
import 'package:gym_app/Pages/lobby.dart';
import 'package:gym_app/Pages/exercise_list.dart';
import 'package:gym_app/Pages/sub_exercise.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    'lobby': (_) => const Lobby(),
    'subexercise': (context) {
      final args = ModalRoute.of(context)!.settings.arguments as List<Object?>;
      return Subexercise(
        subcategories: (args[0] as List<String>?) ?? [],
      );
    },
    'exerciseList': (context) {
      final args = ModalRoute.of(context)!.settings.arguments as String;
      return exerciseList(category: args);
    },
    'exercise': (context) {
      final args = ModalRoute.of(context)!.settings.arguments as Exercise;
      return ExercisePage(exercise: args);
    },
  };
}

