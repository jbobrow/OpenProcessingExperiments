
int rectOne;
float rectTwo;
float backwardsOne=400;
float backwardsTwo=300;
float backwardsThree=150;
float circleW;
float circleLoc4;
float circleY;
float circleLoc;
float circleX;
float circleLoc2;
float circleZ;
float circleLoc3;
boolean circle=true;
boolean circle2=true;
boolean circle3=true;
boolean circle4=true;
int score=0;

float r;
float g;
float b;

PImage eq;
PImage win;

float circleWinDrop=0;
float speed=0;
float gravity=0.2;

void setup () {
  size(320, 400);
  eq=loadImage("eq2.jpg");
  noCursor();
  cursor(CROSS);
  win=loadImage("youWin.png");
  println("Catch all the circles!");
}

void draw () {
  image(eq, 0, 0);
  smooth();
  r=random(255);
  g=random(255);
  b=random(255);

  stroke(0);
  fill(255);
  rectMode(CENTER);
  fill(200, 0, 200);
  rect(rectOne, 300, 50, 50);
  fill(0, 200, 0);
  rect(rectOne, 150, 50, 50);
  rectOne=rectOne+15;

  rect(rectTwo, 250, 30, 30);
  rectTwo=rectTwo+12;

  fill(75, 220, 55);
  rect(backwardsOne, 50, 30, 30);
  fill(76, 171, 242);
  rect(backwardsTwo, 200, 30, 30);
  fill(180, 0, 180);
  rect(backwardsThree, 350, 30, 30);
  backwardsOne=backwardsOne-8;
  backwardsTwo=backwardsTwo-14;
  backwardsThree=backwardsThree-15;
  
  if (circle4==true) {
    fill(r, g, b);
    circleW=circleW+5;
    ellipse(circleW, circleLoc4, 40, 40);
  }

  if (circle2==true) {
    fill(r, g, b);
    circleX=circleX+9;
    ellipse(circleX, circleLoc2, 25, 25);
  }

  if (circle==true) {
    fill(r, g, b);
    circleY=circleY+6;
    ellipse(circleY, circleLoc, 40, 40);
  }

  if (circle3==true) {
    fill(r, g, b);
    circleZ=circleZ+3;
    ellipse(circleZ, circleLoc3, 55, 55);
  }

  strokeWeight(3);
  stroke(r, g, b);
  noFill();
  ellipse(mouseX, mouseY, 70, 70);

  if (rectOne>400) {
    rectOne=0;
  }

  if (rectTwo>400) {
    rectTwo=0;
  }

  if (backwardsOne<0) {
    backwardsOne=399;
  }

  if (backwardsTwo<0) {
    backwardsTwo=399;
  }

  if (backwardsThree<0) {
    backwardsThree=399;
  }

  if (circleW>400) {
    circleW=0;
    circleLoc4=random(320);
  }

  if (circleY>400) {
    circleY=0;
    circleLoc=random(320);
  }

  if (circleX>400) {
    circleX=0;
    circleLoc2=random(320);
  }

  if (circleZ>400) {
    circleZ=0;
    circleLoc3=random(320);
  }

  if (score>=200) {
    imageMode(CORNERS);
    image(win, 0, 0);
    fill(r,g,b);
    circleWinDrop=circleWinDrop+speed;
    speed=speed+gravity;
    ellipse(10,circleWinDrop,5,5);
    ellipse(50,circleWinDrop,5,5);
    ellipse(100,circleWinDrop,5,5);
    ellipse(150,circleWinDrop,5,5);
    ellipse(200,circleWinDrop,5,5);
    ellipse(250,circleWinDrop,5,5);
    ellipse(300,circleWinDrop,5,5);
  }
  
  if (circleWinDrop>height) {
    speed=speed*-0.95;
  }
}

void mousePressed() {
  
  if ((mouseX>circleY-20) && (mouseX<circleY+20)
    && (mouseY>circleLoc-20) && (mouseY<circleLoc+20)) {
    circle=!circle;
    score=score+50;
    println("Your score is " +score);
  }
  if ((mouseX>circleX-20) && (mouseX<circleX+20)
    && (mouseY>circleLoc2-20) && (mouseY<circleLoc2+20)) {
    circle2=!circle2;
    score=score+40;
    println("Your score is " +score);
  }
  if ((mouseX>circleZ-20) && (mouseX<circleZ+20)
    && (mouseY>circleLoc3-20) && (mouseY<circleLoc3+20)) {
    circle3=!circle3;
    score=score+60;
    println("Your score is " +score);
  }
  if ((mouseX>circleZ-20) && (mouseX<circleZ+20)
    && (mouseY>circleLoc3-20) && (mouseY<circleLoc3+20)) {
    circle4=!circle4;
    score=score+50;
    println("Your score is " +score);
  }
}

