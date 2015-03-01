
int gameState=0;

String[] answers0 = {
  "A. A dog", "B. An eagle", "C. A platypus", "D. A roadrunner"
};
String[] answers1 = {
  "A. A dog", 
  "B. An eagle", 
  "C. A platypus", 
  "D. A roadrunner",
};

String[] answers2 = { 
  "A. Death Valley", "B. The Sahara", "C. The Mohave", "D. Antarctica"
};

Question[] questions= new Question[5];

void setup() {
  size(800, 600);
  questions[0]= new Question("What is the Crossroads school mascot?", 3, answers0);
  questions[1]= new Question("What animal has a beak like a duck?", 1, answers1);
  questions[2]= new Question("What is the largest desert in the world?", 3, answers2);
}

void draw() {
  background(0);
  if (gameState == 0) {
    text("WHO WANTS TO BE A MILLIONAIRE?", width/2, height/2);
  } else if (gameState == 1) {
    
    questions[0].display();
  }
}

void mousePressed(){
 
  //FINISH THIS IPHONE PIC
  
}
void keyPressed() {
  if (gameState ==0) gameState = 1;
  else if (gameState == 1) gameState = 0;
  if(question.isCorrectAnswer(key)){
      gameState = 2;
} else{
  //Game Over!!!
  gameState = 3;
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
    textAlign(CENTER);
    noFill();
    //question
    rect(400, 100, 600, 80);
    text(question, 400, 100);
    //answer 1
    rect(200, 300, 150, 65);
    text(answers[0], 200, 300);
    //answer 2
    rect(600, 300, 150, 65);
    text(answers[1], 600, 300);
    //answer 3
    rect(200, 450, 150, 65);
    text(answers[2], 200, 450);
    //answer 4
    rect(600, 450, 150, 65);
    text(answers[3], 600, 450);
  }
  
  boolean isCorrectAnswer(char answer){
    if(answer ==a && correctAnswer) return true;
    else return false;
}

