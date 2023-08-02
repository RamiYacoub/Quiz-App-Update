import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Quiz App',
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int questionIndex = 0;
//   bool showResultsMessage = false;

//   List<Map<String, dynamic>> questionsWithAnswers = [
//     {
//       'question': 'What is your favorite sport?',
//       'answers': ['Football', 'Tennis', 'Basketball', 'Volleyball'],
//     },
//     {
//       'question': 'What is your favorite color?',
//       'answers': ['Red', 'Green', 'Blue', 'White'],
//     },
//     {
//       'question': 'What is your favorite animal?',
//       'answers': ['Dog', 'Cat', 'Horse', 'Camel'],
//     },
//     {
//       'question': 'What is your favorite sport?',
//       'answers': ['Football', 'Tennis', 'Basketball', 'Volleyball'],
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final questionWithAnswer = questionsWithAnswers[questionIndex];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//         leading: Icon(Icons.menu),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (showResultsMessage == false) ...[
//                 Text(questionWithAnswer['question']),
//                 for (int i = 0; i < questionWithAnswer['answers'].length; i++)
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         if (questionIndex < questionsWithAnswers.length - 1) {
//                           questionIndex++;
//                         } else {
//                           showResultsMessage = true;
//                         }
//                       });
//                     },
//                     child: Text(questionWithAnswer['answers'][i]),
//                   ),
//               ],
//               if (showResultsMessage == true) ...[
//                 const Text('Congratulations!'),
//                 Text(
//                     'Your score is : ${questionIndex + 1}/${questionsWithAnswers.length}'),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
