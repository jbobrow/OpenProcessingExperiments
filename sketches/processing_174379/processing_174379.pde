
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
    "A. A lovely person", "B. A meany", "C. Death", "D. Gerald Ford"
  };
  questions [0] = new Question("What is Murdoc?", 'B', answers0);
 
  String[] answers1 = {
    "A. With 2d", "B. In the fish tank", "C. Swallowed by the pelican", "D. In Murdoc's lair"
  };
  questions [1] = new Question("Where is the spanner in Plastic Beach?", 'C', answers1);
 
  String[] answers2 = { 
    "A. Whales", "B. Monsters", "C. Murdoc", "D. Zombies"
  };
  questions [2] = new Question("What is 2d afraid of?", 'A', answers2);
 
  String[] answers3 = { 
    "A. Albert Einstein", "B. Alexa", "C. Murdoc", "D. Rus"
  };
  questions [3] = new Question("Who built Cyborg Noodle", 'C', answers3);
 
 
  String[] answers4 = { 
    "A. The lift", "B. Noodle's cupboard", "C. The studio", "D. His lair"
  };
  questions [4] = new Question("Where is Murdoc trapped in Plastic Beach", 'D', answers4);
}
 
void draw() {
  background(0);
  fill(random(255),random(0),random(0));
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
  fill(random(255),random(0), random(0));
  textSize(25);
  text("GORILLAZ QUIZ!!! \n Turn on caps lock", width/2, height/2);
}
 
void drawCorrectScreen() {
  textAlign(CENTER);
  fill(random(255),random(0), random(0));
  text("OH YA!!!", width/2, height/2);
}
 
 
void drawWrongAnswerScreen() {
  textAlign(CENTER);
  fill(random(255),random(0), random(0));
  text("LOSER!!! \n  Press space to try again.", width/2, height/2);
}
void drawWinScreen() {
  textAlign(CENTER);
  fill(random(255),random(0), random(0));
  text("OH YA YOU JUST WON \n THE GORILLAZ QUIZ!!! \n  Press space to play again.", width/2, height/2);
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

