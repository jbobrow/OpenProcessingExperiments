
PImage plane;
PImage rock;
boolean gameStart = false;
boolean loseGame = false;
int time, timer;
int planeX = -5;
int planeY = 200;
int rockX = 500; 
int rockY = 50;
int maxScore = 0;

void setup() {
  size(700, 500);
  //background(135,206,250);
  time = millis();
  plane = loadImage("plane.png");

  //rock = new PImage[3];
  //for (int i = 0; i < rock.length; i++) {
  //rock[i] = loadImage("rock.png");
  //}  
  rock = loadImage("rock.png");
  smooth();
  frameRate(60);
}

void draw() {
  if (gameStart == false && loseGame == false) {
    background(0);
    stroke(255);
    textSize(40);
    text("WELCOME!", 250, 150);
    textSize(15);
    text("DIRECTIONS: AVOID INCOMING ROCKS USING THE SPACEBAR TO CONTROL THE PLANE!", 40, 200);
    line(150, 360, 540, 360);
    line(150, 420, 540, 420);
    line(150, 360, 150, 420);
    line(540, 420, 540, 360);
    textSize(28);
    text("PRESS SPACEBAR TO BEGIN!", 160, 400); 
    image(plane, 220, planeY);
    image(rock, 130, -25);
    if (keyPressed) {
      if (key == ' ') {
        gameStart = true;
      }
    }
  } 
  else if (gameStart == true && loseGame == false) {
    //rock[i] = new Rock((int)(width, random(height)));
    background(135, 206, 250);
    rect(0, 0, width, 70);
    rect(0, 430, width, 70);
    stroke(0);
    fill(0);
    image(plane, planeX, planeY);
    //image(rock[i],rockX,-100*i);
    image(rock, rockX, rockY);
    timer = millis() - time;
    textSize(10);
    text(timer, 10, 100);
    rockX--;
    frameRate(400);

    if (keyPressed) {
      if (key == ' ') {
        planeY--;
        frameRate(400);
      }
    } 
    else planeY++; 


    if (planeY == 0 || planeY == 345) {
      loseGame = true; 
      gameStart = false;
      planeY = 200;
      rockX = 500;
    }
    if ( rockX - planeX < -120 && rockY - planeY < -190) {
      loseGame = true;
      gameStart = false;
      planeY = 200;
      rockX = 500;
    }
  } 
  else if (gameStart == false && loseGame == true) {
    background(135, 206, 250);
    rect(0, 0, width, 70);
    rect(0, 430, width, 70);
    stroke(0);
    textSize(40);
    text("GAME OVER!", 240, 150);
    textSize(20);
    text("DISTANCE TRAVELED: " + timer, 225, 200);
    if (timer > maxScore) {
      maxScore = timer;
      timer = 0;
    }  
    text("YOUR BEST: " + maxScore, 270, 300);
    line(145, 360, 565, 360);
    line(145, 420, 565, 420);
    line(145, 360, 145, 420);
    line(565, 420, 565, 360);
    textSize(28);
    text("PRESS 'R' TO RESTART!", 205, 400);

    if (keyPressed) {
      if (key == 'r') {
        gameStart = true;
        loseGame = false;
      }
    }
  }
}



