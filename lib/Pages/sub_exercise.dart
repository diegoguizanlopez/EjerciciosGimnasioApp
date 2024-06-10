import 'package:flutter/material.dart';
import 'package:gym_app/Provider/exercise_data.dart';
import 'package:gym_app/Widgets/deffault_scaffold.dart';
import 'package:gym_app/Widgets/style_container.dart';
import 'package:gym_app/Widgets/style_googlefonts.dart';
import 'package:provider/provider.dart';

class Subexercise extends StatelessWidget {
  final List<String> subcategories;

  Subexercise({
    Key? key,
    required this.subcategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    exerciseData excdata = Provider.of<exerciseData>(context, listen: false);
    return DeffaultScaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: subcategories.map((e) {
            return StyleContainer(
              onPressed: () =>
                  Navigator.pushNamed(context, "exerciseList", arguments: e),
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
