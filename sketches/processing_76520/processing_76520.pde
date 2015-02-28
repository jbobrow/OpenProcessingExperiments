
Creature creature;
int time1 = 2000;
int time2 = 5000;
int time3 = 5700;
int time4 = 12000;
int time5 = 18318;
int time6 = 20000;
int currentTime = millis();
int moveX;
int moveY;
int moveSpeed1 = 1;
int moveSpeed2 = 1;
PImage congrats;

void setup () {
  background(206, 206, 206);
  size(600, 500);
  smooth();
  creature = new Creature(100, 130);
  congrats = loadImage("congrats.png");
}

void draw () {
  int currentTime = millis();
  background(206, 206, 206);
  pushMatrix();
  translate(moveX, 0);
  translate(0, moveY);
  creature.drawCreature();
  creature.drawEyes();
  creature.drawArms();
  popMatrix();

  //making the eyes move
  if (currentTime > time1) {
    creature.lookEyes();
  }

  //making the creature move to the right
  if (currentTime > time3) {
    moveX = moveX+moveSpeed1;
  }
  //making the creature stop
  if (moveX >= 300) {
    moveSpeed1 = 0;
  }

  //making the creature move down
  if (currentTime > time4) {
    moveY = moveY+moveSpeed2; 
    if (moveY >= 300) { 
      moveSpeed2 = 0;
    }
  }

  if (currentTime > time5) {
    creature.congrats();
  }

  if (currentTime > time6) {
    background(206, 206, 206);
    creature.congrats();
    pushMatrix();
    translate(300, 300);
    
    creature.drawCreature();
    creature.drawEyes2();
    creature.drawArms2();
    popMatrix();
  } 

  //println("currentTime"+currentTime);
}

class Creature {  
  //draw body of creature
  int x;
  int y;
  float eyesLocX1;
  float eyesLocX2;
  float eyesLocY;
  int speedEyesStop;
  float speedEyesGo;
  float posX1;
  float posY;
  float posX2;
  int time1 = 2000;
  int time2 = 5000;
  int time3 = 5700;
  int time4 = 12000;

  Creature(int X, int Y) {
    x = X;
    y = Y;
    eyesLocX1 = x-10;
    eyesLocX2 = x+10;
    eyesLocY = y-35;
    posX1 = x-40;
    posY = y;
    posX2 = x+40;
    speedEyesGo = -0.13;
    speedEyesStop = 0;
  }

  void drawCreature() {
    fill(0);
    rectMode(CENTER);
    rect(x, y, 80, 120); // main square of body
    rect(x-25, y-75, 30, 40);
    arc(x-25, y-90, 30, 30, -PI, 0);
    rect(x+25, y-75, 30, 40);
    arc(x+25, y-90, 30, 30, -PI, 0);
    arc(x, y-60, 40, 10, -PI, 0);
    fill(255);
    triangle(x-5, y-5, x+5, y-5, x, y+30);

    //draw face of creature
    fill(255);
    ellipse(x-10, y-35, 40, 30);
    ellipse(x+10, y-35, 40, 30);
    triangle(x-25, y-25, x+25, y-25, x, y-10);
    fill(0);

    //draw feet of the creature
    stroke(206, 206, 206);
    ellipse(x-22, y+55, 40, 25);
    ellipse(x+22, y+55, 40, 25);
    noStroke();
  }

  void drawEyes() { // draw eyes of creature
    ellipse(eyesLocX1, eyesLocY, 10, 10);
    ellipse(eyesLocX2, eyesLocY, 10, 10);
  }

  void drawArms() { //draw arms of the creature  
    pushMatrix(); // turn arm #1
    translate(posX1, posY);
    rotate(PI/5);
    rect(posX1-60, posY-130, 20, 50);
    arc(posX1-60, posY-107, 20, 20, 0, PI);
    popMatrix();
    pushMatrix(); // turn arm #2
    translate(posX2, posY);
    rotate(-PI/5);
    rect(posX2-140, posY-130, 20, 50);
    arc(posX2-140, posY-107, 20, 20, 0, PI);
    popMatrix();
  }

  void drawArms2() { //draw arms of the creature  
    pushMatrix(); // turn arm #1
    translate(posX1, posY);
    rotate(degrees(45));
    rect(posX1-60, posY-130, 20, 50);
    arc(posX1-60, posY-107, 20, 20, 0, PI);
    popMatrix();
    pushMatrix(); // turn arm #2
    translate(posX2, posY);
    rotate(degrees(-45));
    rect(posX2-140, posY-130, 20, 50);
    arc(posX2-140, posY-107, 20, 20, 0, PI);
    popMatrix();
  }

  void lookEyes() { // creature looking left and right
    eyesLocX1 = eyesLocX1 + speedEyesGo;
    eyesLocX2 = eyesLocX2 + speedEyesGo;

    if (eyesLocX1 >= 96 || eyesLocX1 <= 84) {
      speedEyesGo = speedEyesGo *-1;
    }
    if (currentTime >= time2) {
      speedEyesGo = speedEyesStop;
    }
  }
  void congrats() {
    String s = "Congratulations!";
    pushMatrix();
    translate(x+100, y-130);
    rotate(degrees(-50));
    rectMode(CENTER);
    stroke(255);
    fill(255);
    //rect(-20, 40, 40, 120);
    //rect(x, y+230, 180, 50);
    //    fill(255);
    //    text(s, x+5, y+242, 180, 50);
    //    textSize(21);
    image (congrats, -40, 50);
    scale(25, 10);
    noStroke();
    popMatrix();
  }
  
  void drawEyes2() { // draw eyes of creature
    ellipse(eyesLocX1-3, eyesLocY, 20, 20);
    ellipse(eyesLocX2+3, eyesLocY, 20, 20);
  }
}

//  void moveBody() {// moving the body
//    x = x+1;
//  }
//
//  void moveEyes() {
//    eyesLocX1 = eyesLocX1 + 1;
//    eyesLocX2 = eyesLocX2 + 1;
//  }

//  void moveArms() {
//    pushMatrix(); // turn arm #1
//    translate(0, 0);
//    rotate(PI-PI/5);
//    posX1 = posX1 + 1;
//    popMatrix();
//    pushMatrix();
//    translate(0, 0);
//    rotate(PI+PI/5);
//    posX2 = posX2 + 1;
//    popMatrix();
//  }



