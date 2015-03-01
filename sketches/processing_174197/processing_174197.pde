
int gameState = 0;
int currentQuestion = 0;
 
PImage img1;



int START_SCREEN = 0;
int GAME_QUESTION = 1;
int CORRECT_ANSWER = 2;
int WRONG_ANSWER = 3;
int WIN_SCREEN = 4;
 
Question[] questions = new Question[5];
 
void setup() {
  size(800, 600);
  textSize(20);
 
 img1 =loadImage("Rocks.gif");

 
 
  String[] answers0 = { 
    "A. A webcomic", "B. A Manwha", " C. A Video game", "D. An Anime"
  };
  questions [0] = new Question(" What is Homestuck?",  'A', answers0);
 
  String[] answers1 = {
    "A.Manga", "B. Anime", " C.Light Visual Novel", "D. Video game"
  };
  questions [1] = new Question("The Devil May Cry was originally a(n)...?", 'D', answers1);
 
  String[] answers2 = { 
     "A.Cartoon Network", "B. Nickelodeon", " C. Disney Channel", "D. Boomerang Channel"
  };
  questions [2] = new Question("Invader Zim was first premiered on...?", 'A', answers2);
 
  String[] answers3 = { 
   "A. Him", "B. Fuzzy Lumpkins", " C. Ms. Moneybucks", "D. The Amoeba boys"
  };
  questions [3] = new Question("Which one is NOT a villian from the tv show, The Powerpuff Girls", 'C', answers3);
 
 
  String[] answers4 = { 
    "A.Bleach ", "B. Rurouni Kenshin", " C. One Piece", "D. Hunter x Hunter"
  };
  questions [4] = new Question("Which of these series has ended?", 'B', answers4);
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
  fill(50);
  ellipse(width/2, height/2-10, 450, 150);
  fill(0,40,255);
  text("WHO WANTS TO BE A MILLIONAIRE*!!! \n Geek Edition! \n Make sure your caps lock is on to play! \n\n\n\n\n\n\n\n\n *you must be a NON-US resident and over the age of 142 to claim the prize", width/2, height/2-35);
}
 
void drawCorrectScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2-10, 600, 150);
  fill(random(255), random(255),random(255));
  text("GOOD JOB! HANG IN THERE! YOU'VE GOT THIS!(THUMBS UP)!!", width/2, height/2);
}
 
 
void drawWrongAnswerScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2+10, 400, 150);
  fill(255, 0, 17);
  text("NOOOO!! GEEZ...(HEAD SHAKE)!!! \n  Press space to try again.", width/2, height/2);
}
void drawWinScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2+10, 400, 150);
  fill(random(255), random(255), random(255));
  text("YOU JUST WON \n WHO WANTS TO BE A MILLIONAIRE!!! \n  Press space to try again.", width/2, height/2);
  image(img1,width/2-150,0);
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

