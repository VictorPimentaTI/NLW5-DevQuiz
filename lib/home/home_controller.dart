import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'home_repository.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async{
    state = HomeState.loading;
    //await Future.delayed(Duration(seconds: 2));

    user = await repository.getUser();
    /*
    user = UserModel(
      name: "Victor Pimenta",
      photoUrl: "https://avatars.githubusercontent.com/u/57304572?v=4"
    );
    */
    state = HomeState.success;
  }
  
  void getQuizzes() async{
    state = HomeState.loading;
    //await Future.delayed(Duration(seconds: 2));
    
    quizzes = await repository.getQuizzes();
    /*
    quizzes = [
      QuizModel(
        title: "NLW5 Flutter",
        imagem: AppImages.blocks,
        questionAwnsered: 1,
        level: Level.facil,
        questions: [
          QuestionModel(
            title: "Está curtindo o Flutter?",
            awnsers: [
              AwnserModel(title: "Estou curtindo"),
              AwnserModel(title: "Amando o Flutter", isRight: true),
              AwnserModel(title: "Muito top"),
              AwnserModel(title: "Nem tanto"),
            ]),
          QuestionModel(
            title: "Está curtindo o Flutter?",
            awnsers: [
              AwnserModel(title: "Estou curtindo"),
              AwnserModel(title: "Amando o Flutter", isRight: true),
              AwnserModel(title: "Muito top"),
              AwnserModel(title: "Nem tanto"),
            ]),
        ]
      )
    ];
    */
    state = HomeState.success;
  }
}