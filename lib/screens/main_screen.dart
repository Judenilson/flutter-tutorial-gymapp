import 'package:flutter/material.dart';
import 'package:gym_app/_common/mycolors.dart';
import 'package:gym_app/models/exercise.dart';
import 'package:gym_app/models/feeling.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final Exercise exercise = Exercise(
      id: "212",
      name: "Remada baixa supinada",
      exercise: "Treino A",
      toDo: "Segura a barra e puxa");

  final List<Feeling> listFeeling = [
    Feeling(id: "11", feeling: "Pouca ativação hoje", date: "2022-03-20"),
    Feeling(id: "12", feeling: "Já senti alguma ativação", date: "2022-03-22"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(children: [
          Text(
            exercise.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(
            exercise.exercise,
            style: const TextStyle(fontSize: 15),
          ),
        ]),
        centerTitle: true,
        backgroundColor: MyColors.blueDark,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    child: const Text("Enviar Foto"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Tirar Foto"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Como fazer?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(exercise.toDo),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listFeeling.length, (index) {
                Feeling feelingNow = listFeeling[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(feelingNow.feeling),
                  subtitle: Text(feelingNow.date),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      print("DELETAR ${feelingNow.feeling}");
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
