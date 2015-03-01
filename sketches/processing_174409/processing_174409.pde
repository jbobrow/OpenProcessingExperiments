
int gameState = 0;

String[] answers0 = {
  "1. Comer Cottrell", 
  "2. An eagle", 
  "3. Stephan of Arabia", 
  "4. Kenny G"
};

String[] answers1 = {
  "1. Dolphin", 
  "2. Whale Shark", 
  "3. Hammerhead ", 
  "4. Great White"
};




Question[]questions = new Question[5];

void setup() {
  size(800, 600);
  //question, which question, answer
  questions [0] = new Question("Who Invented the Jehri Curl", 1, answers0);
  questions [1] = new Question("Which sharks are born with soft heads?", 3, answers1);
}


void draw() {
  background(255, 0, 0);
  if (gameState == 0) {
    textSize(100);
    textAlign(3);
    fill(0,255,0);
    text("$$$$$", width/2, height/2-50);
    textSize(20);
    textAlign(3);
    fill(0);
    text("Who Wants to Be a Millionaire", width/2, height/2);
    text("(Press the Space Bar)", width/2, height/2 +100);
    if (keyPressed && key == ' ') {
      gameState = 1;
    }
  }



  if (gameState == 1) {
    /*jackson.resize(width,height);
     image(jackson, 0,0);
     */
    questions[0].display();
    if (keyPressed && key == '1') {
      gameState = 2;
    }
    if (keyPressed && key == '2' || key == '3' || key =='4') {
      gameState = 3;
    }
    if (keyPressed && key == 'q') {
      gameState = 0;
    }
  }


  if (gameState == 2) {
    textAlign(3);
    text("Correct!!! Click Space to Continue", width/2, height/2);
    if (keyPressed && key == 'q') {
      gameState = 0;
    }
    if (keyPressed && key == ' ') {
      gameState = 4;
    }
  }


  if (gameState ==3) {
    textAlign(3);
    text("No!!! Go Back by Pressing Q", width/2, height/2);
    if (keyPressed && key == 'q') {
      gameState = 0;
    }
  }



  if (gameState == 4) {
    questions[1].display();
    if (keyPressed && key == '3') {
      gameState = 2;
    }
    if (keyPressed && key == '2' || key == '1' || key =='4') {
      gameState = 3;
    }
    if (keyPressed && key == 'q') {
      gameState = 0;
    }
  }
}

class Question {

  String question;
  int correctAnswer;
  String[] answers;

  Question(String nquestion, int ncorrectAnswer, String[] nanswers) {
    question = nquestion;
    correctAnswer = ncorrectAnswer;
    answers = nanswers;
  }

  void display() {
    rectMode(CENTER);
    noFill();
    textAlign(CENTER);
    stroke(150, 60, 0);
    //Question
    rect(400, 100, 600, 80);
    text(question, 400, 100);
    //answer 0
    rect(200, 300, 200, 80);
    text(answers[0], 200, 300);
    //answer 1
    rect(600, 300, 200, 80);
    text(answers[1], 600, 300);
    //answer 2
    rect(200, 450, 200, 80);
    text(answers[2], 200, 450);
    //answer 3
    rect(600, 450, 200, 80);
    text(answers[3], 600, 450);
  }
}



