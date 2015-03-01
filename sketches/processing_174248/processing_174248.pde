
int gameState = 0;
int i = 0;

Question[]questions = new Question[3];

void setup() {
  size(800, 600);
  String[] answers0 = {
    "A. dog", 
    "B. eagle", 
    "C. platypus", 
    "D. roadrunner"
  };
  questions [0] = new Question("What is the Crossroads school mascot?", 'D', answers0);
  String[] answers1 = {
    "A. C", 
    "B. A", 
    "C. D", 
    "D. B"
  };
  questions [1] = new Question("What is my favorite letter?", 'C', answers1);
  String[] answers2 = {
    "A. You", 
    "B. Me", 
    "C. Yesterday", 
    "D. Forever"
  };
  questions [2] = new Question("Happiest dog?", 'B', answers2);
}



void draw() {
  background(0);
  if (gameState ==0) {
    drawSplashScreen();
  } else if (gameState == 1) {
    questions[i].display();
  } else if (gameState == 2) {
    drawCorrect();
  } else if (gameState == 3) {
    drawWrong();
  } else if (gameState == 4) {
    drawWin();
  }
}

void keyPressed() {
  if (gameState==0) {
    gameState = 1;
  } else if (gameState ==1) {
    if (questions[i].isCorrectAnswer(key)) {
      i++;
      if (i> questions.length-1) {
        gameState = 4;
      } else {
        gameState = 2;
      }
    } else {
      gameState = 3;
    }
  } else if (gameState == 2) {
    gameState = 1;
  } else if(gameState == 3){
    i = 0;
    gameState = 0;
  }
}

void mousePressed() {
  if (gameState == 1) {
  }
}

void drawSplashScreen() {
  textAlign(CENTER);
  text("I WANT TO BE A MILLIONAIRE.", width/2, height/2);
}

void drawCorrect() {
  textAlign(CENTER);
  fill(255);
  text("Okay .", width/2, height/2);
}

void drawWrong() {
  textAlign(CENTER);
  fill(255);
  text("no .stop it.", width/2, height/2);
}

void drawWin() {
  textAlign(CENTER);
  fill(255);
  text("wow", width/2, height/2);
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
    textAlign(CENTER, CENTER);
    noFill();
    rect(400, 100, 700, 100);
    text(question, 400, 100);
    //big rectangle(question)
    rect(200, 300, 250, 75);
    text(answers [0], 200, 300);
    //upper left box(answer 0)
    rect(600, 300, 250, 75);
    text(answers [1], 600, 300);
    //upper right box(answer 1)
    rect(200, 450, 250, 75);
    text(answers [2], 200, 450);
    //lower left box(answer 2)
    rect(600, 450, 250, 75);
    text(answers [3], 600, 450);
    //lower right box(answer 3)
  }
  boolean isCorrectAnswer(char answer){
    if(answer == correctAnswer)return true;
    else return false;
  }
}
