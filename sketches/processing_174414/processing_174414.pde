
int gameState =0;
int currentQuestion = 0;

int start_screen = 0;
int game_question = 1;
int correct_answer = 2;
int wrong_answer = 3;
int win_screen = 4;

Question[] questions = new Question [5];

void setup() {
  size (800, 600);
  textSize(20);


  String[] answers0 = { 
    "A. Dog", "B. An Eagle", "C. The Platypus", "D. A Roadrunner"
  };
  questions [0] = new Question ("What is the Crossroads school mascot?", 'D', answers0);

  String[] answers1 = {
    "A. A Dog", "B. A Pelican", "C. A Platypus", "D. A Shark"
  };
  questions [1] = new Question("What animal has a beak like a duck?", 'C', answers1);

  String[] answers2 = {
    "A. Death Valley", "B. The Sahara", "C. The Mohave", "D. Antarctica"
  };
  questions [2] = new Question("Which is the deepest trench in the ocean?", 'D', answers2);

  String[] answers3 = {
    "A. Penguin", "B. Sponge", "C. Rock", "D. Crab"
  };

  questions [3] = new Question("The character ____bob is a popular cartoon character", 'B', answers3);
  
String[] answers4 = {
  "A. 65 lbs", "B. 50 lbs", "C. 35 lbs", "D.20 lbs"
};

questions [4] = new Question("On average, humans place how much stress on their neck by looking down?", 'A', answers4);
}

void draw() {
  background(0);
  if (gameState==start_screen) {
    drawSplashScreen();
  } else if (gameState == game_question) {
    questions[currentQuestion].display();
  } else if (gameState ==correct_answer) {
    drawCorrectScreen();
  } else if (gameState ==wrong_answer) {
    drawWrongAnswerScreen();
} else if (gameState == win_screen) {
  drawWinScreen();
}
}

  void keyPressed() {
    if (gameState==start_screen) {
      gameState = 1;
    } else if (gameState ==game_question) {
      if (questions[currentQuestion].isCorrectAnswer(key)) {
        currentQuestion ++;
        if (currentQuestion > questions.length-1) {
          gameState=win_screen;
        } else {
          gameState= correct_answer;
        }
      } else {
        gameState = wrong_answer;
        //Game Over!!!
      }
    } else if (gameState == correct_answer) {
      gameState = game_question;
    } else if (gameState == wrong_answer || gameState == win_screen) {
      currentQuestion =0;
      gameState = start_screen;
    }
  }


void drawSplashScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2-10, 400, 100);
  fill(255, 255, 0);
  text("WHO WANTS TO BE A MILLIONARE", width/2, height/2);
  text("Harrison Trachman", width/2, height/2+100);
}

void drawCorrectScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2-10, 400, 100);
  fill(255, 255, 0);
  text("CORRECT!!!", width/2, height/2);
}

void drawWrongAnswerScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2+10, 400, 100);
  fill(255, 255, 0);
  text("WRONG ANSWER!!!", width/2, height/2);
}

void drawWinScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2+10, 400, 100);
  fill(255, 255, 0);
  text("YOU WIN!!!", width/2, height/2);
}

class Question {
  String question;
  char correctAnswer;
  String[] answers;
  
  Question(String nquestion, char ncorrectAnswer, String[] nanswers) {
    question = nquestion;
    correctAnswer = ncorrectAnswer;
    answers= nanswers;
  }
  void display(){
    rectMode(CENTER);
    textAlign(CENTER);
    noFill();
    //Question
    rect(400,100,600,80);
    text(question,400,100);
    //Answer 0
    rect(200,300,100,80);
    text(answers[0], 200,300);
    //Answer 1
    rect(600,300,100,80);
    text(answers[1],600,300);
    //Answer 2
    rect(200,450,100,80);
    text(answers[2],200,450);
    //Answer 3
    rect(600,450,100,80);
    text(answers[3],600,450);
    
  }
  
  boolean isCorrectAnswer(char answer){
    if(answer == correctAnswer) return true;
    else return false;
  }
}


