library constants;

import 'package:quizz_geeksgeeks/quiz/models/question.dart';

bool emailVerified = false;

final List<Question> questions = [
  Question(
    text: '1.In a _______ connection, more than two devices can share a single link',
    anwsers: ['A) Point-to-point', 'B) Primary', 'C) Multi-point', 'D) Secondary'],
    correctAnwser: 2,
  ),
  Question(
    text: '2. Communication between a computer and a keyboard involves ______________transmission ?',
    anwsers: ['A) Full-duplex', 'B) Half-duplex', 'C) Simplex', 'D) None of these'],
    correctAnwser: 2,
  ),
  Question(
    text: '3. In a network with 25 computers, which topology would require the most extensive cabling?',
    anwsers: ['A) Star', 'B) Mesh', 'C) Bus', 'D) None of these'],
    correctAnwser: 1,
  ),
  Question(
    text: '4. The _______ is the physical path over which a message travels.',
    anwsers: ['A) Protocol', 'B) Medium', 'C) Signal', 'D) All of the above'],
    correctAnwser: 0,
  ),
  Question(
    text: '5. Which organization has authority over interstate and international commerce in the communications field?',
    anwsers: ['A) ITU-T', 'B) IEEE', 'C) ISO', 'D) FCC'],
    correctAnwser: 3,
  ),
  Question(
    text: '6. The information to be communicated in a data communications system is the ________ ?',
    anwsers: ['A) Medium', 'B) Protocol', 'C) Transmission', 'D) Message'],
    correctAnwser: 3,
  ),
  Question(
    text: '7. Frequency of failure and network recovery time after a failure are measures of the of a network?',
    anwsers: ['A) Performance', 'B) Security', 'C) Reliability', 'D) Feasibility'],
    correctAnwser: 2,
  ),
  Question(
    text: '8. In _______ transmission, the channel capacity is shared by both communicating devices at all times?',
    anwsers: ['A) Full-duplex', 'B) Simplex', 'C) Half-duple', 'D) Half-Simplex'],
    correctAnwser: 0,
  ),
  Question(
    text: '9. An unauthorized user is a network _______ issue?',
    anwsers: ['A) Performance', 'B) Reliability', 'C) Security', 'D) All of the above'],
    correctAnwser: 2,
  ),
  Question(
    text: '10. What is the objective of the knapsack problem?',
    anwsers: ['A) To Get Maximum Total Value In The Knapsack', 'B) To Get Minimum Total Value In The Knapsack', 'C) To Get Maximum Weight In The Knapsack', 'D) To Get Minimum Weight In The Knapsack'],
    correctAnwser: 0,
  ),
];
