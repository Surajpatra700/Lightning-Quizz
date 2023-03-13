class QuizModel {
  static List<Questions> questions = [
    // like List<int> it is List<Item> constructor...
    Questions(
      // Item is the constructor that we have initialised below
      category: "General Knowledge",
      type: "multiple",
      difficulty: "easy",
      question: "Name the first women who cross the English Channel?",
      correct_answer: "Arti Gupta",
      incorrect_answers1: "Sneh Singh",
      incorrect_answers2: "Ujwala Rai",
      incorrect_answers3: "None of the above",
    )
  ];
}

class Questions {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correct_answer;
  final String incorrect_answers1;
  final String incorrect_answers2;
  final String incorrect_answers3;
  // Initially we can't set the variable null so we use '?' sign for null safety..

  Questions({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correct_answer,
    required this.incorrect_answers1,
    required this.incorrect_answers2,
    required this.incorrect_answers3,
    // we use constructor to initialise the variablers of the class
  });

  factory Questions.fromMap(Map<String, dynamic> map) {
    //We use Map<string,dynamic> because data is coming in map format
    //returning Item by mapping the class variables with the decorded map keys
    return Questions(
      category:
          map["category"], // assigning Json file data to these class variables
      type: map["type"],
      difficulty: map["difficulty"],
      question: map["question"],
      correct_answer: map["correct_answer"],
      incorrect_answers1: map["incorrect_answers1"],
      incorrect_answers2: map["incorrect_answers2"],
      incorrect_answers3: map["incorrect_answers3"],
    );
  }
}

//   toMap() => {
//         "category": id,
//         "name": name,
//         "category": category,
//         "image": image,
//         "oldPrice": oldPrice,
//         "price": price,
//       };
// }

// RULES OF MAPPING ------

/* 1) Using rootBundle.loadString load the directory of your json file
   2) Using jsonDecode function decode your string json File to map
   3) we require only the inside of products part so map out that..
   4) Converting step 3 part to a list.
   4) Create a class name Item with all the variables names same as that of json file keys & create a constructor for that
   4) Create a List of Item type named items i.e List<Item> items and place just a single list of index 1 data in it
   5) Use fromMap/fromJson to map our class variables with the keys
   6) Ma

*/