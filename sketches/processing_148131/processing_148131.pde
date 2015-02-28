
//Wander by Luis Silva

import java.util.List;

import org.dishevelled.processing.frames.Animation;
import org.dishevelled.processing.frames.Frames;

//DECLARE
Frames frames;
///main character
Animation mcRight;
Animation mcLeft;
Animation mccurrentAnimation;
//robot character
Animation robRight;
Animation robLeft;
Animation robcurrentAnimation;

//CLASSES
Mc myMc;
Rob myRob;
//Textbox myTb; 



//IMAGES
PImage photo1; //MAIN background
PImage startscreen; //Comic Pg.1 || STARTSCREEN
PImage photo2; //Question mark
PImage photo3; //Exclaimation mark
PImage startscreen2; //Comic Pg. 2
PImage startscreen3; //Comic Pg. 3
PImage startscreen4; //COmic Pg. 4 || END
PFont title;
int screensizex, screensizey, stage;


void setup() {
  stage = 1; 
  screensizex = 1000;
  screensizey = 500;
  size(screensizex, screensizey);
  startscreen = loadImage("pg1.jpg");
  image(startscreen, 0, 0, screensizex, screensizey);
  title = createFont("font", 1000, true);

  smooth();
  frameRate(12);
  frames = new Frames(this);
  //INITIALIZE
  myMc = new Mc();
  myRob = new Rob();
  //myTb = new Textbox(500, 200);

  //SPRITES
  ////Main Character
  List<PImage> McFrames = frames.createFrameList("Main_Walk.png", 0, 0, 100, 100, 5);
  mcRight = frames.createLoopedAnimation(McFrames);
  mcLeft = frames.createLoopedAnimation(frames.flipHorizontally(McFrames));
  ////Robot Character
  List<PImage> RobFrames = frames.createFrameList("Robot_Idle.png", 0, 0, 79, 91, 4);
  robRight = frames.createLoopedAnimation(RobFrames);
  robLeft = frames.createLoopedAnimation(frames.flipHorizontally(RobFrames));

  //Misc 
  photo2 = loadImage("Qu.png");
  photo3 = loadImage("Ex.png");
}

void draw() {
  if (stage==1) {
    //Comic Pg. 1  || START SCREEN
    textAlign(CENTER);
    fill(0);
    text("WANDER", 880, 50);
    text("Press any key to start", 880, 100);
    if (keyPressed == true) {
      stage = 2;
    }
  }
  if (stage==2) {
    //MAIN
    background(50);
    photo1 = loadImage("Background.png");

    image(photo1, 0, 0);
    //CALL FUNCTIONALITY
    myRob.run(); //Behind
    myMc.run(); //Ahead
    //myTb.run();
  }

  if (stage==5) {
    //Comic Pg. 4 - END
    startscreen4 = loadImage("pg4.jpg");
    image(startscreen4, 0, 0, screensizex, screensizey);
    textAlign(CENTER);
    fill(0);
    text("To be continued...", 650, 450);
  }


  if (stage==4) {
    //Comic Pg. 3
    startscreen3 = loadImage("pg3.jpg");
    image(startscreen3, 0, 0, screensizex, screensizey);
    textAlign(CENTER);
    fill(0);
    text("Press 2 to continue", 750, 50);
    if (keyPressed) {
      if (key == '2') {
        stage = 5;
      }
    }
  }


  if (stage==3) {
    //Comic Pg. 2
    startscreen2 = loadImage("pg2.jpg");
    image(startscreen2, 0, 0, screensizex, screensizey);
    textAlign(CENTER);
    fill(0);
    text("Press 1 to continue", 100, 450);
    if (keyPressed) {
      if (key == '1') {
        stage = 4;
      }
    }
  }
}

class Mc {
  //GLOBAL VARIABLES
  float posX = 0;
  boolean right = true;

  //CONSTRUCTOR


  //FUNCTIONS
  void run() {
    display();
    updateAnimation();
    move();
    action();
    next();
    //gravity
  }

  void next(){
   if (posX > 750){
     stage = 3;
   } 
  }

  void action() { 
    if (keyPressed) { //QUESTION MARK
      if (key == 'x' || key == 'X') {
        image(photo2, posX, 410);
      }
    }
    if (keyPressed) {
      if (key == 'z' || key == 'Z') {
        image(photo3, posX, 410);
      }
    }
  }

  void move() {
    //key held faster

    if (keyPressed == true) {
      if (key == CODED) {
        if (keyCode == RIGHT) {
          right = true;
          posX = posX+3;
          mccurrentAnimation.advance();
        }
      }
      if (keyCode == LEFT) {
        right = false;
        posX = posX-3;
        mccurrentAnimation.advance();
      }
    }
  }

  void updateAnimation() {
    if (right) {
      mccurrentAnimation = mcRight;
    } else {
      mccurrentAnimation = mcLeft;
    }
  }

  void display() {
    updateAnimation();
    image(mccurrentAnimation.getCurrentFrame(), posX, 410);
  }
}

class Rob {
  //GLOBAL VARIABLES
  float posX = 850;
  boolean right = true; 

  //CONSTRUCTOR

  //FUNCTIONS
  void run() {
    display();
    updateAnimation();
    //move
    //gravity
  }

  void updateAnimation() {
    if (right) {
      robcurrentAnimation = robRight;
    } 
    else {
      robcurrentAnimation = robLeft;
    }
  }

  void display() {
    right = false;
    updateAnimation();
    robcurrentAnimation.advance();
    image(robcurrentAnimation.getCurrentFrame(), posX, 360);
  }
}

class Textbox {
  //GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  //CONSTRUCTOR
  Textbox(float _x, float _y) {

    x = _x;
    y = _y;
  }
  //FUNCTIONS
  void run() {
    display();
  }

  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x,y, 300, 100);
    
    pushMatrix();
    textSize(16);
    textAlign(CENTER, CENTER);
    String s = "stuff";
    fill(0);
    text(s, x, y, 300, 100);
    popMatrix();
  }
}



