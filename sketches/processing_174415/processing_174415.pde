
int gameState=0;
int currentQuestion = 0;

int START_SCREEN = 0;
int GAME_QUESTION = 1;
int CORRECT_ANSWER = 2;
int WRONG_ANSWER = 3;
int WIN_SCREEN = 4;

Question[] questions = new Question[4];

void setup() {
  size(800, 600);
  textSize(20);



  String[] answers0 = {
    "A. Roadrunner", "B. Eagle", "C. Cow", "D.Dog "
  };
  questions [0] = new Question("What is the Crossroads school mascot?", 'A', answers0);

  String[] answers1= { 
    "A. Dog", "B. Cat", "C. Horse", "D. Zebra"
  }; 
  questions [1] = new Question("What animal has black and white stripes?", 'D', answers1);

  String[] answers2 = { 
    "A. Death Valley", "B. The Sahara", "C. The Mohave", "D. Antarctica"
  };
  questions [2]= new Question ("What is the largest desert in the world?", 'D', answers2);
  String[] answers3 = { 
    "A. Ferrari 458", "B. Lamborghini Aventador", "C. Mclaren P1", "D. 911 turboS"
  };
  questions [3] = new Question("What is the most expensive car", 'C', answers3);
}
void draw () {
  background (0);
  if (gameState == START_SCREEN) {
    drawSplashScreen();
    text ("WHO IS WORTHY OF A MILLION $", width/2, height/2);
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
      // Game Over!
      gameState = WRONG_ANSWER;
    }
  } else if (gameState == CORRECT_ANSWER) {
    gameState = GAME_QUESTION;
  } else if (gameState == WRONG_ANSWER || gameState == WIN_SCREEN) {
    currentQuestion = 0;
    gameState = START_SCREEN;
  }
}

void drawSplashScreen () {
  textAlign (CENTER);
  fill (50);
  ellipse (width/2, height/2, 600, 300);
  fill (0,0,255);
  text ("WHO IS WORTHY OF A MILLION $", width/2, height/2);
}

void drawCorrectScreen() {
  textAlign(CENTER);
  fill(50);
  rect(width/2, height/2-10, 400, 150);
  fill(0, 0, 255);
  text("THATS RIGHT!", width/2, height/2);
}
 
 
void drawWrongAnswerScreen() {
  textAlign(CENTER);
  fill(50);
  rect(width/2, height/2+10, 400, 150);
  fill(0, 0, 255);
  text("GOOD TRY, BUT THATS WRONG!!! \n  Press space to try again.", width/2, height/2);
}
void drawWinScreen() {
  textAlign(CENTER);
  fill(#FFFFFF);
  rect(width/2, height/2+10, 600, 250);
  fill(0, 0, 255);
  text("CONGRATS! YOU HAVE EARNED A MILLION $ \n WHO WANTS TO BE A MILLIONAIRE!!! \n  Press space to try again.", width/2, height/2);
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

