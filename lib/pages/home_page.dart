import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0;
  bool showResultsMessage = false;
  int? yourChoiceIndex;

  List<Map<String, dynamic>> questionsWithAnswers = [
    {
      'question': 'What is your favorite sport?',
      'answers': ['Football', 'Tennis', 'Basketball', 'Volleyball'],
    },
    {
      'question': 'What is your favorite color?',
      'answers': ['Red', 'Green', 'Blue', 'White'],
    },
    {
      'question': 'What is your favorite animal?',
      'answers': ['Dog', 'Cat', 'Horse', 'Camel'],
    },
    {
      'question': 'What is your favorite sport?',
      'answers': ['Football', 'Tennis', 'Basketball', 'Volleyball'],
    }
  ];

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      showResultsMessage = false;
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
                  height: 16.0,
                ),
                Text(
                  'Answer and get points',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: size.height * 0.1),
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
                              Icon(
                                Icons.add,
                                color: i == yourChoiceIndex
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              SizedBox(width: 16.0),
                              Text(
                                questionWithAnswer['answers'][i],
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
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (yourChoiceIndex != null) {
                            if (questionIndex <
                                questionsWithAnswers.length - 1) {
                              questionIndex++;
                            } else {
                              showResultsMessage = true;
                            }
                            yourChoiceIndex = null;
                          } else {
                            print("Please select an option");
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
                          'Your score is : ${questionIndex + 1}/${questionsWithAnswers.length}',
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
