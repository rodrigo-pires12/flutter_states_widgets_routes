import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:states_widgets_routes/models/language.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget title = const Text("Minhas linguagens");

  List<Language> languages = [
    Language("Android Nativo", "Linguagens C, Java, Kotlin"),
    Language("iOS Nativo", "Linguagens Objective-C e Swift"),
    Language("Flutter", "Linguagem Dart"),
    Language("React Native", "Linguagens Javascript e Typescript"),
    Language("PWA", "Linguagens Javascript e Typescript"),
    Language("Ionic", "Linguagens Javascript e Typescript")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: title),
        body: Column(
          children: [
            Wrap(spacing: 10, children: buildChoices()),
            Expanded(
                child: ListView(
              children: buildItemsList(),
            ))
          ],
        ));
  }

  List<Widget> buildChoices() {
    return languages
        .map((l) => ChoiceChip(
            label: Text(l.title),
            selected: l.select,
            onSelected: (value) => setState(() => {l.select = value})))
        .toList();
  }

  List<Widget> buildItemsList() {
    return languages
        .where((l) => l.select)
        .map((l) => Card(
            child: ListTile(
                leading: Icon(l.icon),
                title: Text(l.title),
                subtitle: Text(l.subTitle))))
        .toList();
  }
}
