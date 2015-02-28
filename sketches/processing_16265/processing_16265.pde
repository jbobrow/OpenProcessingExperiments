
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// project 6
// brian phan, desma 28 fall 10

Minim minim;
AudioSample jump;
AudioSample double2;

// setup variables
float posX = mouseX;
float posY = 300;

int direction = 0;
int numofblocks = 0;
int empirblocks = numofblocks * 10;
int score = 0;
int score2 = 0;
int signscore = 0;
int totalscore = 0;
int increment = 100;

int doublecounter = 0;

float rectX = 100;
float rectY = 220;
float rectwidth = 50;
float rectheight = 5;
float radius = 10;

float rect2X = 200;
float rect2Y = 150;
float rect2width = 50;
float rect2height = 5;

float ballX = 270;
float ballY = 90;

float ball2X = ballX;
float ball2Y = ballY;

float rect4Y = 0;

float y;
float y2;
float y3;
float y4;
float y5;
float targetY = rectY;
float target2Y = rect2Y;
float target3Y = ballY;
float target4Y;
float target5Y;
float easing = 0.05;
float easing2 = 0.08;

int page = 1;
int left = 203;
int right = 275;
int top = 168;
int bottom = 183;

int titleleft = 190;
int titleright = 290;
int titletop = 150;
int titlebottom = 170;

int t;
int z;
int scoreboard = 0;

boolean visible = false;
boolean lost = false;
boolean bounce = rectCircleIntersect(rectX, rectY, rectwidth, rectheight, posX, posY, radius);
boolean bounce2 = rectCircleIntersect(rect2X, rect2Y, rect2width, rect2height, posX, posY, radius);
boolean bounce3 = circleCircleIntersect(ballX, ballY, 4, mouseX, posY, radius);
boolean bounce4 = circleCircleIntersect(ball2X, ball2Y, 4, mouseX, posY, radius);

float speed = 0;
float gravity = 0.4;
float platspeed = 0.0;
float platgravity = 0.0;
float platspeed2 = 0.0;
float platgravity2 = 0.0;
float platspeed3 = 0.0;
float platgravity3 = 0.0;

PImage bg;
PImage title;
PFont font;

// setup
void setup()
{
  size(480, 320);
  background(255);
  frameRate(50);
  smooth();
  ellipseMode(RADIUS);
  bg = loadImage("bg.png");
  title = loadImage("title.png");
  font = loadFont("Gotham-Bold-12.vlw");
  textFont(font);

  minim = new Minim(this);
  jump = minim.loadSample("throw.wav");
  double2 = minim.loadSample("lose_flip2.wav");

  rectX = 100;
  rectY = 220;
  rect2X = 200;
  rect2Y = 150;
  ballX = 270;
  ballY = 90;
  targetY = rectY;
  target2Y = rect2Y;
  target3Y = ballY;
}

void draw()
{
  if (page == 1) {
    pageOne();
  }
  else if (page == 2) {
    pageTwo();
  }
  else if (page == 3) {
    pageThree();
  }
}

////////////////////////////////////////////

void pageOne() {
  textFont(font);
  image(title, 0, 0);
  if (mouseX > titleleft && mouseX < titleright && mouseY > titletop && mouseY < titlebottom) {
    fill(200, 200, 200);
    noStroke();
    rect(192, 170, 96, 3);
    if (mousePressed == true) {
      page = 2;
      mousePressed = false;
    }
  }
}

////////////////////////////////////////////

void pageTwo() {
  background(255);
  image(bg, 0, rect4Y-1680);
  fill(0);

  textFont(font);
  textAlign(RIGHT);
  if (scoreboard == 0) {
    text("Score: " + totalscore, 270, 10, 200, 50);
  }
  rect(rectX, rectY, rectwidth, rectheight);
  rect(rect2X, rect2Y, rect2width, rect2height);
  ellipse(mouseX, posY, 10, 10);
  z++;
  t++;
  println(z);
  int s = millis();
  if (t > 700) {
    visible = true;
    fill(255, 0, 0);
    ellipse(ballX, ballY, 4, 4);
  }

  fill(0);

  posY = posY + speed;
  speed = speed + gravity;
  rectY = rectY + platspeed;
  rect2Y = rect2Y + platspeed2;
  ballY = ballY + platspeed3;
  platspeed = platspeed + platgravity;
  platspeed2 = platspeed2 + platgravity2;
  platspeed3 = platspeed3 + platgravity3;

  if ((speed + gravity) < 0) {
    direction = 1;
  }
  else if ((speed + gravity) > 0) {
    direction = 0;
  }

  if (mousePressed == true && numofblocks < 2) {
    if (posY > 280 && lost == false) {
      speed = -10;
    }
  }

  if (posY > 305) {
    posY = 305;
  }

  float dy = targetY - rectY;
  if (abs(dy) > 1) {
    rectY += dy * easing;
  }

  float dy2 = target2Y - rect2Y;
  if (abs(dy2) > 1) {
    rect2Y += dy2 * easing;
  }

  float dy3 = target3Y - ballY;
  if (abs(dy3) > 1) {
    ballY += dy3 * easing;
  }

  float dy4 = target4Y - rect4Y;
  if (abs(dy4) > 1) {
    rect4Y += dy4 * easing2;
  }

  float dy5 = target5Y - ball2Y;
  if (abs(dy5) > 1) {
    ball2Y += dy5 * easing;
  }


  // if intersection 1 occurs
  if(rectCircleIntersect(rectX, rectY, rectwidth, rectheight, mouseX, posY, radius) == true) {
    speed = -10;
    if (platspeed < 30) {
      target2Y = rect2Y + 30;
      target3Y = ballY + 30;
      target4Y = rect4Y + 20;
      platgravity = 0.4;
    }
    bounce = false;
    jump.trigger();
  }

  // if intersection 2 occurs
  if(rectCircleIntersect(rect2X, rect2Y, rect2width, rect2height, mouseX, posY, radius) == true) {
    speed = -10;
    if (platspeed2 < 30) {
      targetY = rectY + 30;
      target3Y = ballY + 30;
      target4Y = rect4Y + 20;
      platgravity2 = 0.4;
    }
    bounce2 = false;
    jump.trigger();
  }

  // if intersection 3 occurs
  if(circleCircleIntersect(ballX, ballY, 8, mouseX, posY, radius) == true && visible == true) {
    speed = -10;
    if (platspeed3 < 30) {
      targetY = rectY + 30;
      target2Y = rect2Y + 30;
      target4Y = rect4Y + 20;
      platgravity3 = 0.4;
      t = 0;
      visible = false;
    }
    bounce3 = false;
    double2.trigger();
  }

  // replacement of platform 1
  if (rectY > 310) {
    platspeed = 0.0;
    platgravity = 0.0;
    rectX = random(30, 420);
    rectY = random(100, 200);
    rect(rectX, rectY, rectwidth, rectheight);
    targetY = rectY;
    score = 0;
    signscore = 0;
  }

  // replacement of platform 2
  if (rect2Y > 310) {
    platspeed2 = 0.0;
    platgravity2 = 0.0;
    rect2X = random(30, 420);
    rect2Y = random(100, 200);
    rect(rect2X, rect2Y, rect2width, rect2height);
    target2Y = rect2Y;
    score = 0;
    signscore = 0;
  }

  // replacement of red ball
  if (ballY > 310 && visible == true) {
    platspeed3 = 0.0;
    platgravity3 = 0.0;
    ballX = random(30, 420);
    ballY = random(100, 200);
    ellipse(ballX, ballY, 8, 8);
    target3Y = ballY;
    score = 0;
    signscore = 0;
  }

  if (platgravity == 0.4) {
    numofblocks = numofblocks + 1;
    score++;
    score2++;
    signscore = score * (numofblocks)/2;
    textAlign(CENTER);
    text("+" + signscore, rectX+22, rectY+18);
    totalscore = score2 * (numofblocks)/2;
  }

  if (platgravity2 == 0.4) {
    numofblocks = numofblocks + 1;
    score++;
    score2++;
    signscore = score * (numofblocks)/2;
    textAlign(CENTER);
    text("+" + signscore, rect2X+22, rect2Y+18);
    totalscore = score2 * (numofblocks)/2;
  }

  if (platgravity3 == 0.4) {
    textAlign(CENTER);
    fill(255, 0, 0);
    ellipse(ballX, ballY, 4, 4);
    text("+2x", ballX, ballY+18);
    totalscore = (score2 * (numofblocks)/2) * 2;
  }

  if ((numofblocks > 2) && (posY > 300)) {
    targetY = rectY - 400;
    target2Y = rect2Y - 400;
    target3Y = ballY - 400;
    target4Y = 0;
    pageThree();
  }
  
  if (z > 1200) {
    rectheight = 4;
    rect2height = 4;
  }
  if (z > 2000) {
    rectheight = 3;
    rect2height = 3;
  }
  if (z > 3000) {
    rectheight = 2;
    rect2height = 2;
  }
}

////////////////////////////////////////////

void pageThree() {
  scoreboard = 1;
  textAlign(CENTER);
  fill(0);
  text("Total Score: " + totalscore, 240, 160);
  text("Try Again?", 240, 180);
  fill(50, 50, 50, 50);
  rect(203, 168, 72, 15);
  lost = true;
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
    fill(200, 200, 200, 100);
    rect(203, 168, 72, 15);
    if(mousePressed == true && lost == true) {
      reset();
      lost = false;
      mousePressed = false;
    }
  }
}

////////////////////////////////////////////

void reset() {
  platspeed = 0.0;
  platgravity = 0.0;
  numofblocks = 0;
  score2 = 0;
  signscore = 0;
  totalscore = 0;
  scoreboard = 0;
  z = 0;
  t = 0;
  rectwidth = 50;
  rectheight = 5;
  rect2width = 50;
  rect2height = 5;
  setup();
}

////////////////////////////////////////////

boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float px, float py, float pr) {
  float circledistX = abs(px - rx - rw/2);
  float circledistY = abs(py - ry - rh/2);
  if (circledistX > (rw/2 + pr)) { 
    return false;
  }
  if (circledistY > (rh/2 + pr)) { 
    return false;
  }
  if (circledistX <= (rw/2 + pr)) { 
    return true;
  }
  if (circledistY <= (rh/2 + pr)) { 
    return true;
  }

  float cornerdistance = pow(circledistX - rw/2, 2) + pow(circledistY - rh/2, 2);
  return cornerdistance <= pow(pr, 2);
}

boolean circleCircleIntersect(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
    return true;
  } 
  else {
    return false;
  }
} 


