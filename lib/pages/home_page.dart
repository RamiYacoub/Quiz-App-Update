import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0;
  bool showResultsMessage = false;
  int correctAnswers = 0;
  int? yourChoiceIndex;

  List<Map<String, dynamic>> questionsWithAnswers = [
    {
      'question': 'What is your favorite sport?',
      'answers': [
        {'text': 'Football', 'icon': Icons.sports_soccer},
        {'text': 'Tennis', 'icon': Icons.sports_tennis},
        {'text': 'Basketball', 'icon': Icons.sports_basketball},
        {'text': 'Volleyball', 'icon': Icons.sports_volleyball},
      ],
      'correctAnswer': 'Football',
    },
    {
      'question': 'What is your favorite color?',
      'answers': [
        {'text': 'Red', 'icon': Icons.circle, 'color': Colors.red},
        {'text': 'Green', 'icon': Icons.circle, 'color': Colors.green},
        {'text': 'Blue', 'icon': Icons.circle, 'color': Colors.blue},
        {'text': 'Brown', 'icon': Icons.circle, 'color': Colors.brown},
      ],
      'correctAnswer': 'Blue',
    },
    {
      'question': 'What is your favorite animal?',
      'answers': [
        {'text': 'Dog', 'icon': Icons.pets},
        {'text': 'Cat', 'icon': Icons.pets},
        {'text': 'Horse', 'icon': Icons.house},
        {'text': 'Camel', 'icon': Icons.cake},
      ],
      'correctAnswer': 'Dog',
    },
    {
      'question': 'What is your favorite sport?',
      'answers': [
        {'text': 'Football', 'icon': Icons.sports_soccer},
        {'text': 'Tennis', 'icon': Icons.sports_tennis},
        {'text': 'Basketball', 'icon': Icons.sports_basketball},
        {'text': 'Volleyball', 'icon': Icons.sports_volleyball},
      ],
      'correctAnswer': 'Football',
    },
  ];

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      showResultsMessage = false;
      correctAnswers = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionWithAnswer = questionsWithAnswers[questionIndex];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!showResultsMessage) ...[
                SizedBox(height: size.height * 0.1),
                Text(
                  questionWithAnswer['question'],
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  'Answer and get points',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // StepProgressIndicator(
                //   totalSteps: questionsWithAnswers.length,
                //   currentStep: questionIndex + 1,
                //   size: 40,
                //   selectedColor: Colors.black,
                //   unselectedColor: Color.fromARGB(59, 119, 117, 117),
                //   customStep: (index, color, _) => color == Colors.black
                //       ? Container(
                //           color: color,
                //           child: Icon(
                //             Icons.check,
                //             color: Colors.white,
                //           ),
                //         )
                //       : Container(
                //           color: color,
                //           child: Icon(
                //             Icons.remove,
                //           ),
                //         ),
                // ),
                // SizedBox(height: 18),
                // Text(
                //   'Step ${questionIndex + 1} of ${questionsWithAnswers.length}',
                //   style: TextStyle(
                //     fontSize: 16,
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Step ${questionIndex + 1}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          ' of ${questionsWithAnswers.length}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    StepProgressIndicator(
                      totalSteps: questionsWithAnswers.length,
                      currentStep: questionIndex + 1,
                      selectedColor: Colors.green,
                      unselectedColor: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                for (int i = 0; i < questionWithAnswer['answers'].length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          yourChoiceIndex = i;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: i == yourChoiceIndex
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              // ? Container(
                              //     width: 40,
                              //     height: 40,
                              //     decoration: BoxDecoration(
                              //       color: Colors.green[200],
                              //       borderRadius: BorderRadius.all(
                              //           Radius.circular(15)),
                              //     ),
                              //     child: Icon(
                              //       questionWithAnswer['answers'][i]
                              //           ['icon'],
                              //       color: i == yourChoiceIndex
                              //           ? Colors.white
                              //           : Colors.black,
                              //     ),
                              //   )
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: questionWithAnswer['answers'][i]
                                              ['color'] !=
                                          null
                                      ? Colors.white
                                      : i == yourChoiceIndex
                                          ? Colors.green[200]
                                          : Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Icon(
                                  questionWithAnswer['answers'][i]['icon'],
                                  color: questionWithAnswer['answers'][i]
                                              ['color'] !=
                                          null
                                      ? questionWithAnswer['answers'][i]
                                          ['color']
                                      : i == yourChoiceIndex
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Text(
                                questionWithAnswer['answers'][i]['text'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: i == yourChoiceIndex
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (yourChoiceIndex != null) {
                            if (questionWithAnswer['answers'][yourChoiceIndex]
                                    ['text'] ==
                                questionWithAnswer['correctAnswer']) {
                              correctAnswers++;
                              print(correctAnswers);
                            }
                            if (questionIndex <
                                questionsWithAnswers.length - 1) {
                              questionIndex++;
                            } else {
                              showResultsMessage = true;
                            }
                            yourChoiceIndex = null;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please choose option'),
                              ),
                            );
                          }
                        });
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              if (showResultsMessage)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize
                          .max, // Add this line to make the column take up full height
                      children: [
                        Text(
                          'Congratulations!',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Your score is : $correctAnswers/${questionsWithAnswers.length}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        TextButton(
                          onPressed: resetQuiz,
                          child: Text('Reset Quiz'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
