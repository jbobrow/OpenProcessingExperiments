
PFont font;

PImage backG;
PImage Rocket;

int INTRO     = 0;
int RUN_GAME  = 1;
int GAME_OVER = 2;
int score = 0;

int gameState = INTRO;

float circleX, circleY;
float circleRadius = 20;

float ellipseX = 50;
float ellipseY = 50;
float ellipseWidth = 10;
float ellipseHeight = 50;

float ellipseA = 250;
float ellipseB = 250;
float ellipsewidth = 100;
float ellipseheight = 50;

float speed = 15;
int level = 0;
int screen = 0;

int last_level = 20
;

void mousePressed() {
  println(mouseX + ","+mouseY);
  if (screen == 0) {
    screen = 1;
  }
}

void setup() {
  size(800, 350);
  ellipseMode(RADIUS);
  font = loadFont("Impact-48.vlw");
  textFont(font);
  noStroke();
  smooth();
  backG = loadImage("backG.jpg");
  Rocket = loadImage("rocket.png");
  
}

void draw() {
  //background(0);
  image(backG, 0, 0);

  show_score();


  if (screen == 0) {
    background(0);
    fill(255);
    textAlign(CENTER);
    text("Click Anywhere to Begin", width/2, height/2);
    text ("Move SpacePod to Aviod Meteors", width/2, height/2-75);
  }
  else if (screen == 1) {

    circleX = mouseX;
    circleY = mouseY;
    score++;
    show_score();


    if ((Intersect(ellipseX, ellipseY, ellipseWidth, ellipseHeight, circleX, circleY, circleRadius)) || (Intersect(ellipseA, ellipseB, ellipsewidth, ellipseheight, circleX, circleY, circleRadius))== true) {
      int score = 0; 
      fill(255, 50, 100);
      screen = 2;
    }
    else {
      fill(100);
    }
    ellipse(ellipseX, ellipseY, ellipseWidth, ellipseHeight);
    ellipse(ellipseA, ellipseB, ellipsewidth, ellipseheight);
    rectMode(CENTER);
    fill(31, 139, 203);
    
    imageMode(CENTER);
    image(Rocket, mouseX, mouseY, 100, 110);
    //rect(mouseX, mouseY, 50, 20);

    ellipseX -= speed;
    ellipseA -= speed;

    if (ellipseX < -300) {
      ellipseX = width;
      ellipseWidth = random(50, 150);
      ellipseY = random(0, 480);
    }

    if (ellipseA < -300) {
      ellipseA = width;
      ellipseWidth = random(50, 150);
      ellipseB = random (0, 480);
      level++;
    }

    if ((level % 10) == 0) {
      speed += .1;
    }

    if ( level == (last_level +1)) {
      screen = 3;
    }
  }
  else if (screen == 2) {

    textAlign(CENTER);
    text("You lose...", width/2, height/2-75);
    text("Click to Try Again", width/2, height/2);
    reset();
    if (mousePressed) {
      score =0;
      screen = 0;


      
      speed = 10;
    }
  }
  else if (screen == 3) {
    // you win
    textAlign(CENTER);
    text("YOU WIN!", width/2, height/2-75);
    text("Click To Play Again.", width/2, height/2);
    score =0;
    reset();

    if (mousePressed) {
      screen = 1;
    }
  }
}


void reset() {
  level = 0;
  speed = 10;
  ellipseX = width+50;
  ellipseA = width+250;
}

boolean Intersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);

  if (circleDistanceX > (rw/2 + cr)) {
    return false;
  }
  if (circleDistanceY > (rh/2 + cr)) {
    return false;
  }
  if (circleDistanceX <= rw/2) {
    return true;
  }
  if (circleDistanceY <= rh/2) {
    return true;
  }

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}

void show_score() {
  fill(0, 255, 100);
  textAlign(LEFT);
  text(score, 30, 40);
}


