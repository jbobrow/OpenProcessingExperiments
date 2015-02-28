
PFont font; //gonna use a font
float x; //xpos of ball
float y; //ypos of ball
int rad; //radius of ball
int xVel; //speed of ball
float increment; //this will be our angle
float oscillation; //use trig on the angle

int score1 = 0; //just for fun
int score2 = 0; //ditto

void setup() {
  size(600, 600);
  smooth();
  font = loadFont("font.vlw");
  x = width/2;
  y = height/2;
  rad = 15;
  xVel = 4;
}

void draw() {
  background(0); //refresh background each frame
  x += xVel; //update xpos with speed
  increment = frameCount * 0.1; //size of increment changes every frame (multiplication keeps it from getting too big too quickly)
  oscillation = sin(increment); //sin of any angle size will always be between -1 and 1;
  //taking the sin of 'increment' gives a full range of values.
  fill(random(255), random(255), random(255));
  ellipse(x, y + 100*oscillation, rad, rad); //draw ellipse
  if (x >= width || x <= 0) { //bounce off vertical walls...
    xVel *= -1; //...by reversing direction
  }

  //let's have some fun.

  textFont(font, 24);
  fill(255);
  text("Score = " + score1, 15, 30); //display score 1 in the upper-left
  text(score2 + " = Score", width-115, 30); //display score 2 in the upper-right

  if (x >= width) { //ball hits the right side
    score1++; //add 1 to score 1
  }
  if (x <= 0) { //ball hits the left side
    score2++; //add 1 to score 2
  }

  if (keyPressed) {
    if (key == 'a' || key == 'A') { //reset score on keypress
      score1 = 0;
    }
  }

  if (keyPressed) {
    if (key == 'l' || key == 'L') { //reset score on keypress
      score2 = 0;
    }
  }

  if (score1 < score2) { // score 2 is up
    text(":(", 110, 60);
    text(":)", width-115, 60);
  }
  else if (score1 > score2) { //score 1 is up
    text(":)", 110, 60);
    text(":(", width-115, 60);
  }
  else { //tied
    text(":|", 110, 60);
    text(":|", width-115, 60);
  }
  textFont(font, 18);
  fill(255, 0, 0);
  text("press 'A'", 15, height-15); //display instructions...
  fill(0, 255, 0);
  text("to be mean", width/2-45, height-15); //in multiple...
  fill(0, 0, 255);
  text("press 'L'", width-85, height-15); //places and colors
}


