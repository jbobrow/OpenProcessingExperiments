
int gameState=0;
int currentQuestion=0;

Question[] questions = new Question[3];


void setup() {
  size(800, 600);

  String[] answers0= {
    "A. dog", "B. Eagle", "C. platyupus", " D. road Runner"
  };
  questions[0] = new Question("What is the Crossroads school mascot", 'D', answers0);

  String[] answers1= {
    "A. Dog", "B.An Eagle", "C. A Platypus", "D. A road runner"
  };
  questions[1] = new Question("What animal has a beak like a duck?", 'C', answers1);

  String[] answers2= { 
    "A. The Artic", "B. The Sahara", "C. the Mohave", "D.  Death Valley"
  };
  questions[2] = new Question("What is the largest desert in the world?", 'A', answers2);
}

void draw() {
  background(0);
  if (gameState==0) {
    drawSplashScreen();
  } else if (gameState==1) {
    questions[currentQuestion].display();
  } else if (gameState==3) {
    drawCorrectScreen();
  } else if (gameState==4) {
    drawWrongScreen();
  }
}
void keyPressed() {
  if (gameState==0) {
    gameState=1;
  } else if ( gameState==1) {
    if (questions[currentQuestion].isCorrectAnswer(key)) {
      currentQuestion++;
      if (currentQuestion > questions.length-1) {
        gameState=3;
      }
    }else {
      gameState=4;
    }
  }else if(gameState==4){
    gameState=0;
  }
}
void drawSplashScreen() {
  textAlign(CENTER);
  fill(70);
  ellipse(random(200), random(200), random(20, -20), random(20, -20));
  fill(255, 255, 255);
  text(" Who wants to be a millionarie? CAPS PLS", width/2, height/2);
}

void drawCorrectScreen() {
  textAlign(CENTER);
  fill(33, 10, 250);
  text("WINNNER........YOU GET NOTHING", random(width/2), random(height/2));
}
void drawWrongScreen() {
  textAlign(CENTER);
  fill(70);
  rect(random(200), random(100), 40, 30);
  fill(255, 255, 255);
  text("You lost. Try agian!", width/2, height/2);
}



class Question {

  String question;
  char correctAnswer;
  String[] answers;

  Question(String nquestion, char ncorrectAnswers, String[] nanswers) {
    question=nquestion;
    correctAnswer=ncorrectAnswers;
    answers=nanswers;
  }

  void display() {
    rectMode(CENTER);
    textAlign(CENTER);
    noFill();
    //Question box
    rect(250, 150, 500, 150);
    text(question, 250, 150);
    // top left box answer one
    rect(100, 250, 200, 100);
    text(answers[0], 100, 250);
    //bottom left box answer two
    rect(100, 450, 200, 100);
    text(answers[1], 100, 450);
    //bottom right box answer four
    rect(450, 250, 200, 100);
    text( answers[3], 450, 250);
    //top right box answer three
    rect(450, 450, 200, 100);
    text( answers[2], 450, 450);
  }
  boolean isCorrectAnswer(char answer) {
    if (answer== correctAnswer) return true;
    else return false;
  }
}



