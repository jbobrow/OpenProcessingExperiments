
/*
  Hannah Drossman
  Midterm
  April 3, 2010
*/

int start_time = 0;

//Position of Luna
int posX = 500;
int posY = 600;

//Luna's width and height 
int iX = 0;
int iY = 0;
float lW = 200;
float lH = 300;

//Height from which treats fall
int treatHeight = -3000;

int score = 0;

//5 fat-free treats to win, 5 regular to lose
int win = 5;
int lose = -5;

//arrays for the x and y pos. of the treats
float[] treatX;
float[] treatY;

boolean[] isFatFree; 
boolean gameOver;

//images
PImage wood;
PImage currentLuna;
PImage luna;
PImage mouth;
PImage fatfree;
PImage regular;
PImage barc;
PImage instructions;

// adjust these:
int TREAT_SPEED = 4;
int DOG_SPEED = 45;

PFont arial;
//intro
boolean intro = true;

void setup() {
  size(1000, 800);

  arial = loadFont("ArialMT-24.vlw");
  textFont(arial, 24);

  wood = loadImage("wood_floor.png");
  luna = loadImage("luna.png");
  fatfree = loadImage("fatfree_treat.png");
  regular = loadImage("regular_treat.png");
  barc = loadImage("barc_jacobs.png");
  instructions = loadImage("instructions.png");
  mouth = loadImage("mouth.png");

  treatX = new float[7];
  treatY = new float[7];

  isFatFree = new boolean[7];

  // set the initial x and y positions of all the treats:
  int i = 0;
  while ( i <= 6 ) {
    treatX[i] = random(0, width);
    treatY[i] = random(treatHeight, 0);

    if (random(0, 50) < 30) {
      isFatFree[i] = false;
    } 
    else {
      isFatFree[i] = true;
    }
    i = i + 1;
  }
}

void draw() {
  background(#A7CFFF);

  //intro
  if (intro) {
    //wallpaper stripes
    stroke(#9BC8FF);
    strokeWeight(4);
    int s = 0;
    while ( s <= 1000 ) {
      line( s, 0, s, height);
      s = s + 15;
    }
    //logo
    imageMode(CORNER);
    image(barc, 30, 30);
    //floor
    imageMode(CENTER);
    image(wood, 0, 850);
    textAlign(CENTER);

    //directions
    imageMode(CENTER);
    image(instructions, width/2, 350);
    
    fill(0);
    text("Click mouse to continue", 500, 500);
    noFill();
  }
  else {
    stroke(#9BC8FF);
    strokeWeight(4);

    //wallpaper stripes
    int s = 0;
    while ( s <= 1000 ) {
      line( s, 0, s, height);
      s = s + 15;
    }
    //logo
    imageMode(CORNER);
    image(barc, 30, 30);
    //floor
    imageMode(CENTER);
    image(wood, 0, 850);

    currentLuna = luna;

    //treats
    int i = 0;
    while ( i <= 6 ) {
      //fatfree
      if (isFatFree[i]) {
        image(fatfree, treatX[i], treatY[i], 30, 10);
        treatY[i] = treatY[i] + TREAT_SPEED;
      }
      //regular
      else {
        image(regular, treatX[i], treatY[i], 30, 10);
        treatY[i] = treatY[i] + TREAT_SPEED;
      }
      //reset treats after they fall below window
      if (treatY[i] > height) {
        treatX[i] = random(0, width);
        treatY[i] = random(-5000, 0);
      }
      //checks distance between treats and luna, change mouth
      if (dist(treatX[i], treatY[i], posX-100, posY-100) <= 75 ) {
        currentLuna = mouth;
      } 
      //increase score
      //distance between treats and luna
      if (dist(treatX[i], treatY[i], posX-100, posY-100) <= 75 ) { 
        if (isFatFree[i]) {
          treatX[i] = random(0, width);
          treatY[i] = random(-5000, 0);
          score++;
          fill(0);
          textMode(CENTER);
          lW = 200;
          lH = lH;
        } 
        //decrease score, resets treats, enlarges luna
        else {
          treatX[i] = random(0, width);
          treatY[i] = random(-5000, 0);
          fill(255);
          score--;
          lW = lW + 20;
        }
        if (score == win) {
          gameOver = true;
        }
      }
      i = i + 1;
      if (gameOver == true) { //winning message
        noLoop();
        textAlign(CENTER);
        text("Congratulations! You win!", 500, 100);
      }
      if (score == lose) { //loser message
        noLoop();
        textAlign(CENTER);
        text("Sorry! You lose!", 500, 100);
      }
    }
    imageMode(CENTER);
    image(currentLuna, posX, posY, lW, lH); //luna
    //score
    text(score, 500, 50);
  }
}
//click mouse to close intro
void mousePressed() {
  intro = false;
}
//press keys to move luna
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      posX = posX-DOG_SPEED;
    } 
    else if (keyCode == RIGHT) {
      posX = posX+DOG_SPEED;
    }
  }
}

