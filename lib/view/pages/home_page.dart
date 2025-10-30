import 'package:flutter/material.dart';
import 'package:rick_and_morty/controller/home_controller.dart';
import 'package:rick_and_morty/model/models/character_model.dart';
import 'package:rick_and_morty/model/repository/character_repository.dart';
import 'package:rick_and_morty/view/widgets/card_person_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(
        homeController: HomeController(
          characterRepository: CharacterRepository(
            baseUrl: "https://rickandmortyapi.com/api",
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final HomeController homeController;
  const HomePage({super.key, required this.homeController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CharacterModel> listCharacter = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    widget.homeController.getAllCharacter().then((value) {
      setState(() {
        listCharacter = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(221, 31, 31, 31),
        title: Center(
          child: Text(
            'RICK AND MORTY API',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                itemBuilder: (context, index) => CardPersonWidget(
                  character: listCharacter[index],
                ),
                separatorBuilder: (contex, index) => const SizedBox(height: 20),
                itemCount: listCharacter.length,
              ),
            ),
    );
  }
}
