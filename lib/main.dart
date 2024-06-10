import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gym_app/Provider/exercise_data.dart';
import 'package:gym_app/ThemeData/themes.dart';
import 'package:gym_app/Widgets/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExcerciseData(),
      child: MaterialApp(
        theme: myTheme,
        routes: getRoutes(),
        initialRoute: 'lobby',
      ),
    ),
  );
}
