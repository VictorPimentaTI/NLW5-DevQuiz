import 'package:DevQuiz/home/widget/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widget/level_button/level_button_widget.dart';
import 'package:flutter/material.dart';

import 'widget/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: "Fácil"
                ),
                LevelButtonWidget(
                  label: "Médio"
                ),
                LevelButtonWidget(
                  label: "Difícil"
                ),
                LevelButtonWidget(
                  label: "Perito"
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 14,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget()
                ]
              ),
            )
          ],
        ),
      )
    );
  }
}