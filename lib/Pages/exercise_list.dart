import 'package:flutter/material.dart';
import 'package:gym_app/Entities/exercise.dart';
import 'package:gym_app/Provider/exercise_data.dart';
import 'package:gym_app/Widgets/deffault_scaffold.dart';
import 'package:gym_app/Widgets/style_circularprogress.dart';
import 'package:gym_app/Widgets/style_container.dart';
import 'package:gym_app/Widgets/style_googlefonts.dart';
import 'package:provider/provider.dart';

class ExcerciseList extends StatelessWidget {
  String category;
  ExcerciseList({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExcerciseData excdata = Provider.of<ExcerciseData>(context, listen: false);
    return DeffaultScaffold(
        body: FutureBuilder(
      future: excdata
          .getListExcercise(excdata.traductValue(false, false, category)),
      builder: (BuildContext context, AsyncSnapshot<List<Excercise>> snapshot) {
        if (snapshot.hasData) {
          Set<String> uniqueEquipment =
              snapshot.data!.map((e) => e.equipment!).toSet();
          return _exerciseElements(
              data: snapshot.data!, uniqueEquipment: uniqueEquipment);
        }
        return Center(
            child: StyleCircularprogress(
          text: "Working...",
        ));
      },
    ));
  }
}

class _exerciseElements extends StatefulWidget {
  List<Excercise> data;
  Set<String> uniqueEquipment;
  _exerciseElements(
      {required this.data, required this.uniqueEquipment, super.key});

  @override
  State<_exerciseElements> createState() => _exerciseElementsState();
}

class _exerciseElementsState extends State<_exerciseElements> {
  String? value; // Initializing value as an empty string
  @override
  Widget build(BuildContext context) {
    ExcerciseData excdata = Provider.of<ExcerciseData>(context, listen: false);
    return Column(children: [
      Row(
        children: [
          StyleContainer(
            width: MediaQuery.of(context).size.width / 1.6,
            backgroundColor: Colors.white,
            borderColor: Colors.black,
            clip: 10,
            padding: EdgeInsets.all(10),
            edgeInsets: EdgeInsets.all(10),
            child: DropdownButton(
              value: value,
              isExpanded: true, // Evita que el botón se expanda
              items: widget.uniqueEquipment.map<DropdownMenuItem<String>>(
                (e) {
                  return DropdownMenuItem(
                    value: e,
                    child: SizedBox(
                      // Limita el ancho máximo del elemento
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: StyleGoogleFonts(
                        weight: FontWeight.w600,
                        body: excdata.traductEquipment(true, e).toUpperCase(),
                      ),
                    ),
                  );
                },
              ).toList(),
              onChanged: (String? change) {
                setState(() {
                  value = change!;
                });
              },
            ),
          ),
          Expanded(child: Container()),
          StyleContainer(
            edgeInsets: EdgeInsets.all(20),
            clip: 5,
            padding: EdgeInsets.all(10),
            onPressed: () {
              setState(() {
                value = null;
              });
            },
            child: StyleGoogleFonts(
              body: "Limpiar",
              white: true,
            ),
          ),
        ],
      ),
      Expanded(
        child: StyleContainer(
          backgroundColor: Colors.white,
          clip: 0,
          borderColor: Colors.black,
          child: ListView(
            children: widget.data
                .where(
                  (element) =>
                      value == null ? true : element.equipment == value,
                )
                .map((e) => _excercise(excercise: e))
                .toList(),
          ),
        ),
      )
    ]);
  }
}

class _excercise extends StatelessWidget {
  Excercise excercise;
  _excercise({super.key, required this.excercise});

  @override
  Widget build(BuildContext context) {
    ExcerciseData excdata = Provider.of<ExcerciseData>(context, listen: false);
    return StyleContainer(
      onPressed: () {
        Navigator.pushNamed(context,"exercise", arguments: excercise);
      },
        padding: EdgeInsets.all(10),
        edgeInsets: EdgeInsets.all(10),
        clip: 5,
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
              padding: EdgeInsets.only(top:10,bottom: 5),
              child: StyleGoogleFonts(
                body: excercise.name!.toUpperCase(),
                white: true,
                weight: FontWeight.w600,
              ),
            )
          ],
        ));
  }
}
