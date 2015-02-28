
float circleX = random(300, 400);
float circleY = random(300, 400);
float circleSz = 20;

float paddleX = 790;
float paddleY = 100;
float paddleW = 32;
float paddleH = 66;

float compaddleX = 0;
float compaddleY = 100;
float compaddleW = 32;
float compaddleH = 66;

//score
int g = 0;
int e = 0;

//speed
float t1 = 4;
float t2 = 5;

//image
PImage gimg;
PImage complayer;
PImage player;


import ddf.minim.*;

Minim minim;
AudioPlayer in;



void setup()
{
  size(800, 500);
  gimg = loadImage("universe3.jpg");
  player = loadImage("bomberman2.gif");
  complayer = loadImage("bombermanred.gif");
  smooth();


// instantiate a Minim object
minim = new Minim(this);
// load a file, default sample buffer size is 1024
in = minim.loadFile("overworld.mp3");
// play the file
in.play();


  if (random(0, 1) < 0.5) {
    t2 = t2 * -1;
  }
  if (random(0, 1) < 0.5) {
    t1 = t1 * -1;
  }
}

void draw()
{
  paddleY = mouseY;
  if (t1 < 0) {
    compaddleY = circleY;
  }

  //middleline
  fill(50);
  rect(400, 0, 2, 550);

  //background(0);
  fill(100, 100);
  image(gimg, 0, 0);
  rect(0, 0, width, height);

  //score
  fill(220);
  text("Redman Score:"+ g, 160, 460);
  text("Whiteman Score:"+ e, 500, 460);
  textSize(20);

  // draw paddle
  image(player, paddleX-22, paddleY);
  fill(220, 0, 50, 0);
  // rectMode(CORNERS);
  paddleY = constrain(paddleY, 0, height-paddleH);
  rect(paddleX, paddleY, paddleW, paddleH);

  // draw compaddle
  image(complayer, compaddleX, compaddleY);
  fill(50, 200, 50, 0);
  compaddleY = constrain(compaddleY, 0, height-compaddleH);
  rect(compaddleX, compaddleY, compaddleW, compaddleH);
  noStroke();

  //draw ball
  fill(random(50, 225), random(50, 225), random(50, 225));
  ellipse(circleX, circleY, circleSz, circleSz);
  noStroke();
  circleX = circleX +t1;
  circleY = circleY +t2;

  checkWalls();
  checkPaddles();
  checkcomPaddles();
}


void checkPaddles() {
  if (t1 > 0) {
    if (circleX + circleSz/2 > paddleX ) {
      if (circleY >= paddleY && circleY <= paddleY + paddleH) {
        t1 = t1 * -1;
      }
    }
  }
}


void checkcomPaddles() {
  if (t1 < 0) {
    //if (circleX + circleSz/2 >= 650 && circleX+circleSz/2 <= 655){
    if (circleX - circleSz/2 < compaddleX + compaddleW ) {
      if (circleY >= compaddleY && circleY <= compaddleY + compaddleH) {
        t1 = t1 * -1;
      }
    }
  }
}

void checkWalls() {
  if (circleX >= width-circleSz/2) {
    t1 = t1 * -1;
    g = g +1;
    println(g);
    circleX = random(300, 400);
    circleY = random(300, 400);
  }
  if (circleY >= height-circleSz/2) {
    t2 = t2 * -1;
  }

  else if (circleX <= circleSz/2) {
    t1 = t1 * -1;
    e = e +1;
    println(e);
    circleX = 350;
    circleY = 50;
  }
  else if (circleY <circleSz/2) {
    t2 = t2 * -1;
  }
}


