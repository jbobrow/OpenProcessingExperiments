
/************************************************************************
 Assignment #: 4
 Name: Sandra Tamarin
 E-mail: stamarin@haverford.edu
 Course: CS 110 - Section 001
 Submitted: 10/24/12
 
 Description: A grassy field with carrots. When the mouse is pressed between
 height/2 and height-80, the carrots fly away, and a bunny is drawn at the 
 mouse location facing either forwards or backwards. The bunny then bounces 
 forwards or backwards, depending on which way it is facing, until it exits the 
 screen. Up to 20 bunnies can be drawn at one time.
***************************************************************************/


// declare global variables
int MAX_NUM_OBJECTS = 20;
int idxBunnies = 0;
boolean mouseHasBeenPressed = false;

// declare bunny array
Bunny[] bunnies = new Bunny[MAX_NUM_OBJECTS];

// declare carrots array
Carrot[] carrots = new Carrot[50];


void setup() {
  size(600, 500);
  smooth();
  frameRate(30);

  // initialize carrots array
  for (int i = 0; i < carrots.length; i++) {
    carrots[i] = new Carrot((int)random(0, width), (int)random(height/2, height), (int)random(10, 35), (int)random(10, 35));
  }
}


void draw() {
  // draw background
  background(0, 200, 0);
  fill(60, 110, 255);
  noStroke();
  rect(0, 0, width, height/2);
  // draw sun
  stroke(0);
  strokeWeight(2);
  line(0, height/2, width, height/2);
  fill(255, 255, 0);
  ellipse(70, 60, 80, 80);

  // display carrots
  for (int i = 0; i < carrots.length; i++) {
    carrots[i].displayCarrot();
    if (mouseHasBeenPressed) {
      carrots[i].moveCarrot();
    }
  }

  // display bunnies
  for (int i = 0; i < bunnies.length; i++) {
    if (bunnies[i] != null) {
      bunnies[i].drawBunny();
      bunnies[i].moveBunny();
      bunnies[i].bounceBunny();
    }
  }
}


void mousePressed() {
  // create a new object based on location clicked and store it into bunnies[idxBunnies]
  if (mouseY < height-80 && mouseY > height/2) {
    bunnies[idxBunnies] = new Bunny (mouseX, mouseY, (int) random(80, 150));
  }

  // increment index into bunnies, keeping it in the range 0...MAX_NUM_OBJECTS)
  idxBunnies = (idxBunnies+1) % MAX_NUM_OBJECTS;

  // sets mouse having been pressed to true
  mouseHasBeenPressed = true;
}


class Bunny {
  // bunny fields
  float x;
  float y;
  int w;
  int h;
  float m;
  float speed  = 5;
  int direction;

  // bunny constructor
  Bunny(float tempX, float tempY, int tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    m = (int) (random(0, 2)*6)-3;
    if (m > 0) {
      h = w;
    } 
    else {
      h = -w;
    }
  }

  //bunny methods
  void drawBunny() {
    // draw bunny
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, w, w/2);
    ellipse(x+h/2, y-w/4, w/2, w/2);
    ellipse(x-h/4, y+w/4, w/3, w/4);
    ellipse(x+h/4, y+w/4, w/3, w/4);
    ellipse(x+h/2, y-w/2, w/8, w/2.3);
    fill(0);
    ellipse(x+h/1.7, y-w/4, w/10, w/10);
  }

  // move bunny
  void moveBunny() {
    x = x + m;
    y = y + speed;
    if (m > 0) {
      h = w;
    } 
    else {
      h = -w;
    }
  }

  // bounce bunny
  void bounceBunny() {
    if (y >= (height-w/2)) {
      speed = -speed;
    } 
    else if (y <= height/2) {
      speed = -speed;
    }
  }
}


class Carrot {
  // carrot fields
  float carrotX;
  float carrotY;
  float carrotW;
  float carrotChange;

  // carrot constructor
  Carrot(int tempCarrotX, int tempCarrotY, int tempCarrotW, int tempCarrotChange) {
    strokeWeight(2);
    carrotX = tempCarrotX;
    carrotY = tempCarrotY;
    carrotW = tempCarrotW;
    carrotChange = tempCarrotChange;
  }

  // carrot methods
  void displayCarrot() {
    // draw carrot
    fill(240, 200, 0);
    triangle(carrotX, carrotY, carrotX+carrotChange, carrotY, carrotX+carrotChange/2, carrotY+2*carrotChange);
    fill(0, 100, 0);
    triangle(carrotX, carrotY, carrotX+carrotChange/6, carrotY-carrotChange/2, carrotX+carrotChange/3, carrotY);
    triangle(carrotX+carrotChange/3, carrotY, carrotX+carrotChange/2, carrotY-carrotChange/2, carrotX+2*carrotChange/3, carrotY);
    triangle(carrotX+2*carrotChange/3, carrotY, carrotX+5*carrotChange/6, carrotY-carrotChange/2, carrotX+carrotChange, carrotY);
  }

  // move carrot
  void moveCarrot() {
    carrotY -= 3;
  }
}

