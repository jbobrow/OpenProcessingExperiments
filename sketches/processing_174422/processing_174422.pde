
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
    "A. 1776", "B. 1778 ", "C. 1801", "D. 1772"
  };
  questions [0] = new Question("In which year was the independence from England declared ?", 'A', answers0);
 
  String[] answers1 = {
    "A. the Appalachians", "B. the Cascades", "C. the Alps", "D. the Rocky Mountains"
  };
  questions [1] = new Question("Which mountain range is Pikes Peak located in?", 'D', answers1);
 
  String[] answers2 = { 
    "A. Vermont  ", "B. Pennsylvania", "C. Georgia", "D. Hawaii"
  };
  questions [2] = new Question(" Which of the original 13 colonies was founded by William Penn?", 'B', answers2);
 
  String[] answers3 = { 
    "A. Earth", "B. Jupiter", "C. Mercury", "D. Pluto"
  };
  questions [3] = new Question("Which planet is closest to the sun??", 'C', answers3);
 
 
  String[] answers4 = { 
    "A. nothing", "B. the person who keeps the score", "C. the center of the court", "D. an Expression of friendship"
  };
  questions [4] = new Question("What does -love- mean in a game of tennis?", 'A', answers4);
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
      // Game Over!!!
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
  fill(#85DE22);
  ellipse(width/2, height/2-10, 450, 150);
  fill(#F23120);
  text("WHO WANTS TO BE A MILLIONAIRE!!! \n Make sure your caps lock is on to play!", width/2, height/2);
}
 
void drawCorrectScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2-10, 400, 150);
  fill(255, 255, 0);
  text("CORRECT!!!", width/2, height/2);
}
 
 
void drawWrongAnswerScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2+10, 400, 150);
  fill(255, 255, 0);
  text("WRONG ANSWER!!! \n  Press space to try again.", width/2, height/2);
}
void drawWinScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2+10, 400, 150);
  fill(255, 255, 0);
  text("YOU JUST WON \n WHO WANTS TO BE A MILLIONAIRE!!! \n  Press space to try again.", width/2, height/2);
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
 
 
 
   boolean isCorrectAnswer(char answer) {
    if ( answer ==  correctAnswer )return true;
    else return false;
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
 
}
