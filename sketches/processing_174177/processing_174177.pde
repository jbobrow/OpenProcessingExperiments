
String[] answers1= {
  "A. Stalking", "B. Creeping", "C. Photography", "D. Killing People"
};
String[] answers2= {
  "A. Lame", "B. Nerdy", "C. Dope AF", "D. Creepy"
};
String[] answers3= {
  "A. Smuggling weed", "B. Delivering packages", "C. Being awesome", "D. all of the above"
};
String[] answers4= {
  "A. People are ignorant", "B. The FAA sucks", "C. Phantom pilots are idiots", "D. All of the above"
};

import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context

PImage fail;
PImage win;
PImage suscess;
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] speed = new float[100];
float[] stroke = new float[100];

int gameState = 0;
int currentQuestion = 0;

int START_SCREEN = 0;
int GAME_QUESTION = 1;
int CORRECT_ANSWER = 2;
int WRONG_ANSWER = 3;
int WIN_SCREEN = 4;
int CORRECT_SCREEN=5;


Question[] questions=new Question[4];

void setup() {
  size(800, 600);
  questions[0]=new Question("Multi Rotors are best used for…?", 'a', answers1);
  questions[1]=new Question("How would you best describe a multicopter?", 'c', answers2);
  questions[2]=new Question("A multicopter has been used for...", 'd', answers3);
  questions[3]=new Question("There are legal issues surrounding multicopters because…", 'd', answers4);
  minim = new Minim(this);
  player = minim.loadFile("Money in the bank (Ft Young Buck) HQ.mp3", 2048);
  player.play();
  fail = loadImage("dumbcat.png");
  win = loadImage("cat.png");
  suscess = loadImage("baby.png");
  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    speed[i] = random(1, 10);
    stroke[i] = random(1, 5);
  }
}
void draw() {

  background(0);
  if (gameState == START_SCREEN) {
    makeitrain();
    drawSplashScreen();
  } else if (gameState == GAME_QUESTION) {
    questions[currentQuestion].display();
  } else if (gameState == CORRECT_ANSWER) {
    drawWinScreen();
  } else if (gameState == WRONG_ANSWER) {
    drawFailScreen();
  } else if (gameState == WIN_SCREEN) {
    drawWinScreen();
  }else if (gameState == CORRECT_SCREEN) {
    drawSuscessScreen();
  }
}

void keyPressed() {
//  if (gameState==0) gameState=1;
//  //else if(gameState==1) gameState=0;
//  else if (gameState==1) gameState=2;
//  if (questions[i].isCorrectAnswer(key)) {
//    gameState=2;
//  } else {
//    //gameover
//    gameState=3;
//  }
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
  textSize(30);
  fill(50);
  fill(255, 0, 0);
  text("WHO WANTS TO BE A MILLIONAIRE?", width/2, height/2);
  textSize(25);
  text("You Lt. Weinburg?", width/2, height/2+20);
  textSize(20);
  fill(255, 100, 255);
   text("Press any key to continue", width/2, height/2+80);
     textSize(30);

  fill(255, 0, 0);
}


void drawFailScreen() {
  imageMode(CENTER);
  image(fail, width/2, height/2);
  fail.resize(0, 300);
  textAlign(CENTER);
  textSize(20);
  //text("FAIL", width/2, 100);
  fill(255,0,0);
  text("THERE IS NO HOPE - BETTER DROP SCHOOL AND FIND A CREW", width/2, height-100);
  fill(255, 100, 255);
    text("Press any key to continue", width/2, height-30);
    fill(255,0,0);
}


void drawWinScreen() {
   imageMode(CENTER);
   textSize(20);
  image(win, width/2, height/2);
  fill(255,0,0);
  text("CORRECT!- Feel free to pimp wid da kat", width/2, height-60);
  fill(255, 100, 255);
    text("Press any key to continue", width/2, height-30);
    fill(255,0,0);
}
void drawSuscessScreen(){
  image(suscess, width/2, height/2);
  
}


void makeitrain() {
  background(0);
  stroke(255);
  smooth();
  for (int i = 0; i < 100; i++) {
    textSize(40);
    fill(10, 255, 10);
    text('$', xCoord[i], yCoord[i]);
    //point(xCoord[i], yCoord[i]);
    //line(xCoord[i], yCoord[i],xCoord[i], yCoord[i]+10);
    yCoord[i] += speed[i];
    if (yCoord[i]>height+10) {
      yCoord[i]=1;
    }
  }
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
    rectMode(CENTER);
    textAlign(CENTER);
    stroke(255, 0, 0);
    textSize(15);
    //fill(0,50,255);
    noFill();
    //question
    rect(400, 100, 600, 80);
    text(questions, 400, 100); 
    //answer0
    rect(200, 300, 250, 80);
    text(answers[1], 600, 300); 
    //answer1
    rect(600, 300, 250, 80);
    text(answers[0], 200, 300);
    //answer2
    rect(200, 450, 250, 80);
    text(answers[2], 200, 450);
    //answer3
    rect(600, 450, 250, 80);
    text(answers[3], 600, 450);
      
    }
    //  boolean isCorrectAnswer(char answer) {
    //    if (answer == correctAnswer==0) return true;
    //    else return false;
    //  }
    boolean isCorrectAnswer(char answer) {
      if ( answer ==  correctAnswer )return true;
      else return false;
    }
  }



