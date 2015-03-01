
int gameState = 0;
int currentQuestion = 0;
 
int START_SCREEN = 0;
int GAME_QUESTION = 1;
int CORRECT_ANSWER = 2;
int WRONG_ANSWER = 3;
int WIN_SCREEN = 4;
 
Question[] questions = new Question[5];
 
void setup() {
  size(800, 600);
  textSize(20);
 
 
  String[] answers0 = { 
   "Moo",
"Moo Berry Crunch",
"Muddle Berry",
"All of the above"
  };
  questions [0] = new Question("Max Rothschild is also known as:", 'D', answers0);
 
  String[] answers1 = {"Once a week",
"Twice a week",
"He doesn't",
"Daily"};
  questions [1] = new Question("How often does Levy row?", 'D', answers1);
 
  String[] answers2 = {"Ice Age",
"Celebration",
"Street Talkin'",
"Blueberry Yum Yum"};
  questions [2] = new Question("Which song is by Denzel Curry", 'A', answers2);
}

 
void draw() {
  background(0);
  if (gameState == START_SCREEN) {
    drawSplashScreen();
  } else if (gameState == GAME_QUESTION) {
    questions[currentQuestion].display();
  } else if (gameState == CORRECT_ANSWER) {
    drawCorrectScreen();
  } else if (gameState == WRONG_ANSWER) {
    drawWrongAnswerScreen();
  } else if (gameState == WIN_SCREEN) {
    drawWinScreen();
  }
}
 
void keyPressed() {
  if (gameState == START_SCREEN) {
    gameState = 1;
  } else if (gameState == GAME_QUESTION) {
    if (questions[currentQuestion].isCorrectAnswer(key)) {
      currentQuestion ++;
      if (currentQuestion > questions.length-1) {
        gameState = WIN_SCREEN;
      } else {
        gameState = CORRECT_ANSWER;
      }
    } else {
     
      gameState = WRONG_ANSWER;
    }
  } else if (gameState == CORRECT_ANSWER) {
    gameState = GAME_QUESTION;
  } else if (gameState == WRONG_ANSWER || gameState == WIN_SCREEN) {
    currentQuestion = 0;
    gameState = START_SCREEN;
  }
}
 
 
 
void drawSplashScreen() {
  textAlign(CENTER);
  
  fill(0, 255, 0);
  text("WHO WANTS TO ANSWER SOME QUESTIONS?", width/2, height/2);
}
 
void drawCorrectScreen() {
  textAlign(CENTER);

  fill(0, 255, 0);
  text("NICE!", width/2, height/2);
}
 
 
void drawWrongAnswerScreen() {
  textAlign(CENTER);

  fill(0, 255, 0);
  text("NOPE SORRY!", width/2, height/2);
}
void drawWinScreen() {
  textAlign(CENTER);
 
  fill(0, 255, 0);
  text("CONGRATS, YOU DID IT", width/2, height/2);
}
 
 
 class Question {
 
  String question;
  char correctAnswer;
  String[] answers;
 
  Question(String nquestion, char ncorrectAnswer, String[] nanswers) {
    question = nquestion;
    correctAnswer = ncorrectAnswer;
    answers = nanswers;
  }
 
  void display() {
    rectMode(CENTER);
    textAlign(CENTER);
    noFill();
    // Question
    rect(400, 100, 600, 80);
    text(question, 400, 100);
    // Answer 0
    rect(200, 300, 100, 80);
    text(answers[0], 200, 300);
    // Answer 1
    rect(600, 300, 100, 80);
    text(answers[1], 600, 300);
    // Answer 2
    rect(200, 450, 100, 80);
    text(answers[2], 200, 450);
    // Answer 3
    rect(600, 450, 100, 80);
    text(answers[3], 600, 450);
  }
 
  boolean isCorrectAnswer(char answer) {
    if ( answer ==  correctAnswer )return true;
    else return false;
  }
}

