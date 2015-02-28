
/* @pjs preload="squirrel.png, bg.png, carA.png, carB.png, nut0.png,"; */

float guyXOne = 200;
float guyYOne = 20;
float guyHspeed = 0;
float guyVspeed = 0;

float carAXOne = 0;
float carAYOne = 100;
float carAYTwo = 160;
float carBXOne = 320;
float carBYOne = 250;
float carBYTwo = 310;

float nutAXOne = 100;
float nutAXTwo = 110;
float nutAYOne = 110;
float nutAYTwo = 120;

float nutBXOne = 290;
float nutBXTwo = 300;
float nutBYOne = 110;
float nutBYTwo = 120;

float nutCXOne = 100;
float nutCXTwo = 110;
float nutCYOne = 270;
float nutCYTwo = 280;

float nutDXOne = 290;
float nutDXTwo = 300;
float nutDYOne = 270;
float nutDYTwo = 280;

int nutA = 1;
int nutB = 1;
int nutC = 1;
int nutD = 1;

int score = 0;
int win = 0;

PImage squirrel;
PImage nut;
PImage carA;
PImage carB;
PImage bg;

void setup() {
  size(400,400);
  squirrel = loadImage("squirrel.png");
  nut = loadImage("nut0.png");
  carA = loadImage("carA.png");
  carB = loadImage("carB.png");
  bg = loadImage("bg.png");
}

void draw() {
  noStroke();
  if (win == 0){
    image(bg,0,0);
    guyXOne += guyHspeed + random(-2,2);
    guyYOne += guyVspeed + random(-2,2);
    float guyXTwo = guyXOne + 20;
    float guyYTwo = guyYOne + 20;
    carAXOne += 5;
    carBXOne += -5;
    if (carAXOne > width) {
      carAXOne = -80;
    }
    if (carBXOne < -80) {
      carBXOne = width;
    }
    float carAXTwo = carAXOne + 80;
    float carBXTwo = carBXOne + 80;
    
    if (nutA==1) {
      image(nut,nutAXOne,nutAYOne);
    }
    if (nutB==1) {
      image(nut,nutBXOne,nutBYOne);
    }
    if (nutC==1) {
      image(nut,nutCXOne,nutCYOne);
    }
    if (nutD==1) {
      image(nut,nutDXOne,nutDYOne);
    }
    image(squirrel,guyXOne,guyYOne);
    image(carA,carAXOne,carAYOne);
    image(carB,carBXOne,carBYOne);
    
    if (guyYOne < 0) {
      guyYOne = 0;
    }
    if (guyXOne > width) {
      guyXOne = -20;
    }
    if (guyXTwo < 0) {
      guyXOne = width;
    }
    if (guyYOne > height) {
      win = 1;
    }
    
    if (guyYTwo > carAYOne && guyYOne < carAYTwo) {
      if (guyXTwo > carAXOne && guyXOne < carAXTwo) {
        win = -1;
      }
    }
    if (guyYTwo > carBYOne && guyYOne < carBYTwo) {
      if (guyXTwo > carBXOne && guyXOne < carBXTwo) {
        win = -1;
      }
    }
    
    if (guyYTwo > nutAYOne && guyYOne < nutAYTwo && nutA==1) {
      if (guyXTwo > nutAXOne && guyXOne < nutAXTwo) {
        nutA = 0;
        score += 100;
      }
    }
    if (guyYTwo > nutBYOne && guyYOne < nutBYTwo && nutB==1) {
      if (guyXTwo > nutBXOne && guyXOne < nutBXTwo) {
        nutB = 0;
        score += 100;
      }
    }
    if (guyYTwo > nutCYOne && guyYOne < nutCYTwo && nutC==1) {
      if (guyXTwo > nutCXOne && guyXOne < nutCXTwo) {
        nutC = 0;
        score += 100;
      }
    }
    if (guyYTwo > nutDYOne && guyYOne < nutDYTwo && nutD==1) {
      if (guyXTwo > nutDXOne && guyXOne < nutDXTwo) {
        nutD = 0;
        score += 100;
      }
    }
  }
  if (win == 1) {
    background(100,200,100);
    textSize(64);
    text("YOU WIN",60,220);
  }
  if (win == -1) {
    background(200,100,100);
    textSize(64);
    text("YOU LOSE",60,220);
  }
  fill(255);
  textSize(12);
  text("SCORE: " + score,0,12);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      guyVspeed = -4;
    }
    if (keyCode == DOWN){
      guyVspeed = 4;
    }
    if (keyCode == LEFT) {
      guyHspeed = -4;
    }
    if (keyCode == RIGHT){
      guyHspeed = 4;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN) {
      guyVspeed = 0;
    }
    if (keyCode == LEFT || keyCode == RIGHT) {
      guyHspeed = 0;
    }
  }
}


