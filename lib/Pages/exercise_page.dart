import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/Entities/exercise.dart';
import 'package:gym_app/Provider/exercise_data.dart';
import 'package:gym_app/Widgets/deffault_scaffold.dart';
import 'package:gym_app/Widgets/style_container.dart';
import 'package:gym_app/Widgets/style_googlefonts.dart';
import 'package:provider/provider.dart';

class ExercisePage extends StatelessWidget {
  Excercise excercise;
  ExercisePage({Key? key, required this.excercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExcerciseData excdata = Provider.of<ExcerciseData>(context, listen: false);
    return DeffaultScaffold(
        name: excercise.name!.toUpperCase(),
        body: ListView(
          children: [
            StyleContainer(
              borderColor: Colors.black,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  StyleContainer(
                    clip: 10,
                    child: FadeInImage(
                      placeholder: AssetImage("assets/gif/loading.gif"),
                      image: NetworkImage(excercise.gifUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  StyleContainer(
                      edgeInsets: EdgeInsets.only(top: 10),
                      child: StyleGoogleFonts(
                        body: excercise.name!.toUpperCase(),
                        white: true,
                        weight: FontWeight.w600,
                      ))
                ],
              ),
            ),
            StyleContainer(
                edgeInsets: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                padding: EdgeInsets.all(10),
                clip: 10,
                child: Column(
                  children: [
                    StyleContainer(
                        edgeInsets: EdgeInsets.only(top: 10, bottom: 15),
                        child: StyleGoogleFonts(
                          body: "Músculo principal:".toUpperCase(),
                          white: true,
                          weight: FontWeight.w900,
                        )),
                    StyleContainer(
                        child: StyleGoogleFonts(
                      decoration: TextDecoration.underline,
                      body: excdata
                          .traductValue(false, true, excercise.target!)
                          .toUpperCase(),
                      white: true,
                    )),
                    StyleContainer(
                        edgeInsets: EdgeInsets.only(top: 40, bottom: 15),
                        child: StyleGoogleFonts(
                          body: "Músculos secundarios:".toUpperCase(),
                          white: true,
                          weight: FontWeight.w900,
                        )),
                    ...excercise.secondaryMuscles!.map(
                      (e) {
                        return StyleContainer(
                            edgeInsets: EdgeInsets.all(5),
                            child: StyleGoogleFonts(
                              body: e.toUpperCase(),
                              white: true,
                            ));
                      },
                    )
                  ],
                )),
            StyleContainer(
              padding: EdgeInsets.all(10),
              clip: 10,
              edgeInsets: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                  children: excercise.instructions!.map((e) {
                return StyleContainer(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        excercise.instructions!.indexOf(e) != 0
                            ? const Divider(
                                color: Colors.white,
                              )
                            : Container(),
                        StyleContainer(
                          edgeInsets: EdgeInsets.only(top: 10, bottom: 10),
                          child: StyleGoogleFonts(
                            white: true,
                            body: e,
                          ),
                        ),
                      ],
                    ));
              }).toList()),
            )
          ],
        ));
  }
}
