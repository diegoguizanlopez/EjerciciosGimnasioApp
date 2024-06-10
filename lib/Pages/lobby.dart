import 'package:flutter/material.dart';
import 'package:gym_app/Entities/exercise.dart';
import 'package:gym_app/Provider/exercise_data.dart';
import 'package:gym_app/Widgets/deffault_scaffold.dart';
import 'package:gym_app/Widgets/style_circularprogress.dart';
import 'package:gym_app/Widgets/style_container.dart';
import 'package:gym_app/Widgets/style_googlefonts.dart';
import 'package:provider/provider.dart';

class Lobby extends StatelessWidget {
  const Lobby({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    exerciseData excdata = Provider.of<exerciseData>(context, listen: false);
    return DeffaultScaffold(
        body: ListView(
      children: excdata.bodyPartsS.keys
          .map((e) => _Category(
                category: e,
              ))
          .toList(),
    ));
  }
}

class _Category extends StatelessWidget {
  String category;
  _Category({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    exerciseData excdata = Provider.of<exerciseData>(context, listen: false);
    return StyleContainer(
      onPressed: () {
        Navigator.pushNamed(context, 'subexercise',arguments:[excdata.targetListS[category],"subexercise",true,"exerciseList"]);
      },
      edgeInsets: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      clip: 15,
      backgroundColor: Colors.black,
      borderColor: Colors.indigo,
      child: Column(
        children: [
          StyleContainer(
              edgeInsets: EdgeInsets.all(10),
              clip: 20,
              backgroundColor: Colors.white,
              borderColor: Colors.white,
              padding: EdgeInsets.all(5),
              child: Image.asset(
                  "assets/icons/${excdata.traductor(true, false, category, true)}.png")),
          StyleGoogleFonts(
            body: category.toUpperCase(),
            white: true,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}