
int gameState = 0; 
int present = 0;

int START = 0;
int QUESTION = 1;
int WRONG = 2;
int CORRECT = 3;
int WIN = 4;


Question[] questions = new Question [5];


void setup() {
  size(800, 600);
  background(0);
  String[] answers0 = {
    "(A) a dog", "(B) an eagle", "(C) a platypus", "(D) a roadrunner"
  };
  questions [0] = new Question("What is the Crossroad schoool mascot?", 'D', answers0);
  String[] answers1 = {
    "(A) 1976", "(B) 1776", "(C) 1767", "(D)7617"
  };
  questions [1] = new Question("When did the US declare independence?",'B',answers1);
}

void draw() {
  background(0);
  textAlign(CENTER);
  fill(255);
  if (gameState == START) {
    splashScreen();
  } else if (gameState == QUESTION) {
    questions[present].display();
  } else if (gameState == WRONG) {
    wrong();
  } else if (gameState == CORRECT) {
    correct();
  } else if (gameState == WIN) {
    win();
  }
  
}
void keyPressed() {
 if(gameState == START) {
   gameState = 1;
 } else if(gameState == QUESTION) {
   if(questions[present].correct(key)){
     present ++;
     if(present > questions.length-1) {
       gameState = WIN;
     } else {
       gameState = CORRECT;
     }
   } else {
     gameState = WRONG;
   }
 } else if (gameState == CORRECT) {
   gameState = QUESTION;
 } else if(gameState == WRONG || gameState == WIN) {
   present = 0;
   gameState = START;
  } 
}

void splashScreen() {
  float x = random(width);
  float y = random(height);
  frameRate(10);
  background(0);
  text("who wants to be a millionaire?", width/2, height/2);
  fill(random(255), random(255), random(255));
  stroke(random(150), random(150), random(150), 50);
  ellipse(x, y, 100, 100);
}

void correct() {
  text("correct", width/2, height/2);
}

void wrong() {
  text("you are a failure and a disappointment", width/2, height/2);
}

void win() {
 text("you won. you live another day.", width/2, height/2);
}

class Question{
  
  String question;
  int correctAnswer;
  String[] answers;
  
  Question(String nquestion, int ncorrectAnswer, String[] nanswers) {
    question = nquestion;
    correctAnswer = ncorrectAnswer;
    answers = nanswers;
  }
  
  void display(){
  rectMode(CENTER);
  textAlign(CENTER);
  fill(255);
    rect(400,100,width-100,110);
    rect(200,275,270,90);
    rect(600,275,270,90);
    rect(200,450,270,90);
    rect(600,450,270,90);
    
    fill(0);
     text(question,400,100);
     text(answers[0], 200,275);
     text(answers[1],600,275);
     text(answers[2],200,450);
     text(answers[3],600,450);
     
     
  }
  boolean correct(char answer) {
    if (answer == correctAnswer) return true;
    else return false;
  }
}



