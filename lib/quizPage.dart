import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gk_quiz/quizModel.dart';
import 'package:gk_quiz/result.dart';
import 'package:math_expressions/math_expressions.dart';

class QuizScreen extends StatefulWidget {
  final name;
  final click;
  const QuizScreen({super.key, required this.name, this.click = false});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int counter = 0;
  bool click = false;

  // String randomValueGenerator() {
  //   String a;
  //   List<dynamic> options = [
  //     "ProductDataModel.items[index].correct_answer",
  //     "ProductDataModel.items[index].incorrect_answer1",
  //     "ProductDataModel.items[index].incorrect_answer3",
  //     "ProductDataModel.items[index].incorrect_answer4",
  //   ];
  //   int value = Random().nextInt(4);
  //   if (value == 1) {
  //     a = options[0];
  //   } else if (value == 2) {
  //     a = options[1];
  //   } else if (value == 3) {
  //     a = options[2];
  //   } else {
  //     a = options[3];
  //   }
  //   return a;
  // }

  // dynamic solve(String str){
  //   Parser().parse(str).evaluate(EvaluationType.REAL,ContextModel()) as double
  //   }.toInt();
  

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final loadFile = await rootBundle.loadString("assets/files/quiz.json");
    final decodedData = jsonDecode(loadFile);
    var quizData = decodedData["results"];
    QuizModel.questions =
        List.from(quizData).map<Questions>((item) => Questions.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Center(
                    child: Image.network(
                  "https://cdn.w600.comps.canstockphoto.com/quiz-in-golden-circle-stars-and-black-stock-illustrations_csp78294551.jpg",
                  fit: BoxFit.cover,
                  height: 110,
                  width: 180,
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 25),
                  child: Text(
                    "Welcome to Quick Quiz  ",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "${widget.name}",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: Colors.orange),
                  ),
                ),
                //],
                //),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemCount: QuizModel.questions.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${index + 1}. ${QuizModel.questions[index].question}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    click = true;
                                    counter++;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: click
                                        ? Colors.orange
                                        : Colors.grey.shade300,
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      "A.  ${QuizModel.questions[index].correct_answer}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: click
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: InkWell(                               
                                onTap: () {
                                  setState(() {
                                    click = true;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: click
                                        ? Colors.orange
                                        : Colors.grey.shade300,
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      "B. ${QuizModel.questions[index].incorrect_answers2}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: click
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    click = true;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: click
                                        ? Colors.orange
                                        : Colors.grey.shade300,
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      "C.  ${QuizModel.questions[index].incorrect_answers3}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: click
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    click = true;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: click
                                        ? Colors.orange
                                        : Colors.grey.shade300,
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      "D.  ${QuizModel.questions[index].incorrect_answers1}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: click
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            
                          ],
                        ),
                  
                      );
                    }),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 20),
                  child: InkWell(
                    onTap: (){
                      int store = counter;
                      //Utils(check: true).toastMessage("ThankYou for attempting");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(value: store)));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      //),
    );
  }
}
