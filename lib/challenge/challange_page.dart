import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'challenge_controller.dart';
import 'widgets/next_button/next_button_widget.dart';

class ChallangePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  const ChallangePage({Key? key, required this.questions, required this.title}): super(key:key);

  @override
  _ChallangePageState createState() => _ChallangePageState();
}

class _ChallangePageState extends State<ChallangePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
    void initState() {
      controller.currentPageNotifier.addListener(() {
        setState(() {
        });
      });
      pageController.addListener(() {
        controller.currentPage = pageController.page!.toInt() + 1;
      });
      super.initState();
    }

    void nextPage() {
      if (controller.currentPage < widget.questions.length)
        pageController.nextPage(
          duration: Duration(milliseconds: 100),
          curve: Curves.linear
        );
    }

    void onSelected(bool value){
      if(value){
        controller.qtdeAwnsersRight++;
      }
      nextPage();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //BackButton(),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                }
              ),
              ValueListenableBuilder<int>(valueListenable: controller.currentPageNotifier, builder: (context, value, _) => QuestionIndicatorWidget(
                currentPage: value,
                length: widget.questions.length
              ),)
            ],
          )
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
          .map(
            (e) => QuizWidget(
              question: e,
              onSelected: onSelected,
            )).toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if(value < widget.questions.length)
                    Expanded(child: NextButtonWidget.white(label: "Pular", onTap: nextPage)),
                    if(value == widget.questions.length)
                    Expanded(child: NextButtonWidget.green(label: "Confirmar", onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => 
                        ResultPage(
                          title: widget.title,
                          result: controller.qtdeAwnsersRight,
                          length: widget.questions.length,
                        )
                      ));
                    } )),
                  ],
              )
              )),
      ),
    );
  }
}