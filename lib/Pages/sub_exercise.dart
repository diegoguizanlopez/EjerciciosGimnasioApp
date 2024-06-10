import 'package:flutter/material.dart';
import 'package:gym_app/Provider/exercise_data.dart';
import 'package:gym_app/Widgets/deffault_scaffold.dart';
import 'package:gym_app/Widgets/style_container.dart';
import 'package:gym_app/Widgets/style_googlefonts.dart';
import 'package:provider/provider.dart';

class SubExcercise extends StatelessWidget {
  final List<String> subcategories;

  SubExcercise({
    Key? key,
    required this.subcategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExcerciseData excdata = Provider.of<ExcerciseData>(context, listen: false);
    return DeffaultScaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: subcategories.map((e) {
            return StyleContainer(
              onPressed: () =>
                  Navigator.pushNamed(context, "excerciseList", arguments: e),
              edgeInsets: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              clip: 20,
              child: Center(
                child: StyleGoogleFonts(
                  body: e.toUpperCase(),
                  white: true,
                  weight: FontWeight.w600,
                  size: 30,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
