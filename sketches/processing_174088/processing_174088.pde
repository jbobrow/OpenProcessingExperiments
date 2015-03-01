
int gameState=0;
int currentQuestion=0;
int START_SCREEN=0;
int GAME_QUESTION=1;
int CORRECT_ANSWER=2;
int WRONG_ANSWER=3;
int WIN_SCREEN=4;

Question[]questions=new Question[5];
void setup() {
  size(800, 600);
  String[]answers_0= {
    "A. Algeria", 
    "B. Lesotho", 
    "C. Singapore", 
    "D. Guatemala"
  };
  questions [0]=new Question("Which of the following countries borders Tunisia?", 'a', answers_0); 
  String []answers_1= {
    "A.Sofia", 
    "B.Praia", 
    "C.Bangui", 
    "D.Thimphu"
  };
  questions [1]=new Question ("What is the capital of Bhutan?", 'd', answers_1);
  String []answers_2= {
    "A.India", 
    "B.U.S.A", 
    "C.Nigeria", 
    "D.China"
  };

  questions [2]=new Question ("Which country has the second largest population?", 'a', answers_2);
  String []answers_3= {
    "A.India, China, \n France ", 
    "B.U.S.A, France,\n China", 
    "C.U.K., U.S.A, \n Russia", 
    "D.Russia, China, \n U.S.A"
  };
  questions [3]=new Question ("Which three countries have \n the most powerful military power?", 'c', answers_3);
  String []answers_4= {
    "A.Japan", 
    "B.Monaco", 
    "C.Switzerland", 
    "D.Singapore"
  };
  questions [4]=new Question ("Which country has the highest life expectancy?", 'd', answers_4);
}
void draw() {
  background(0);
  if (gameState==START_SCREEN) {
    drawSplashScreen();
  } else if (gameState==GAME_QUESTION) {
    questions[currentQuestion].display();
  } else if (gameState==CORRECT_ANSWER) {
    drawCorrectScreen();
  } else if (gameState==WRONG_ANSWER) {
    drawWrongAnswerScreen();
  } else if (gameState==WIN_SCREEN) {
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
      // Game Over
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
  ellipse(width/2, height/2, 600, 125);
  fill(#87CEE3);
  text("Who Wants To Be A Millionaire!!!", width/2, height/2);
  textSize(30);
}
void drawCorrectScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2, 600, 125);
  fill(#87CEE3);
  text("Correct", width/2, height/2);
  textSize(30);
}
void drawWrongAnswerScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2, 600, 125);
  fill(#87CEE3);
  text("Wrong \n Press space to try again.", width/2, height/2);
  textSize(30);
}
void drawWinScreen() {
  textAlign(CENTER);
  fill(50);
  ellipse(width/2, height/2, 600, 125);
  fill(#87CEE3);
  text("You Win \n Press space to play again.", width/2, height/2-10);
  textSize(30);
}

class Question {
  String questions;
  char correctAnswer;
  String[] answers;

  Question(String nquestions, char ncorrectAnswer, String[]nanswers) {
    questions=nquestions;
    correctAnswer=ncorrectAnswer;
    answers=nanswers;
  }

  void display() {
    textAlign(CENTER);
    noFill();
    textSize(30);

    text(questions, width/2, 100);
    textAlign(LEFT);
    ///answer box #1  
    text(answers[0], 100, 300);
    //answer box #2 
    text(answers[1], 500, 300);
    //answer box #3 
    text(answers[2], 100, 450);
    //answer box #4 
    text(answers[3], 500, 450);
  }
  boolean isCorrectAnswer(char answer) {
    if (answer==correctAnswer)return true;
    else return false;
  }
}



