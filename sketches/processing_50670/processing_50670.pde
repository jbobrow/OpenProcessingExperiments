
//Sarah Keeling, Assignment 4
//Jim Robert's Processing for the Arts, CMU Spring 2012
//Copyright 2012
//
//Falling objects taken from code on the Processing Forum found at:
//http://processing.org/discourse/yabb2/YaBB.pl?num=1275997615
//Posted by Cedric, twitter.com/CedricKiefer

FallObject myObject;

int numObjects = 40;
FallObject [] ob1 = new FallObject [numObjects];

float x = 250;
float y = 350;
float speedVar = 10;
float circleSize = 80;

float fallRate = random (-height);


void setup () {
  size (500, 500);
  smooth ();

  for (int i = 0; i < ob1.length; i++) {
    ob1 [i] = new FallObject();
    myObject = new FallObject ();
  }
}

void draw () {

  background (#E9DFED);

  ball ();
  for (int i = 0; i < ob1.length; i++) {
    ob1[i].fall ();
  }
  textSize (20);
  fill (0);
  text (frameCount, 400, 60);
  textSize (30);
  text ("Dodge!", 50, 60);
  
  if (frameCount == 11000) {
    fill(0);
    rect (0,0,width,height);
    fill (255);
    text ( "YOU WIN!", width/2, height/2);
}
}

class FallObject {

  float r = random (600);
  float fallRate = random (-height);

  void fall () {
    fallRate = fallRate + 1;
    fill(0, 10, 200, 180);
    ellipse(r, fallRate, 10, 10);

    if (fallRate > height) {
      r = random(600);
      fallRate = random(-200);
    }

    if (frameCount == 600) {
      fallRate = fallRate + 2;
    }
    if (frameCount == 2000) {
      fallRate = fallRate+ 3;
    }

    if (frameCount == 10000) {
      fallRate = fallRate+ 4;
    }
  }
}


void mousePressed () {
  if ( mousePressed ) {
    circleSize = circleSize/(2);
  }
}

void mouseReleased () {
  circleSize = 80;
}

void ball () {
  noStroke ();
  fill (#DC19E0);
  ellipse (x, y, circleSize, circleSize);
}


void keyPressed () {
  if (keyCode == UP) {
    y = y- speedVar;
  }

  if ( keyCode == DOWN ) {

    y = y + speedVar;
  }

  if (keyCode == RIGHT ) {
    x = x +  speedVar;
  }

  if ( keyCode == LEFT ) {
    x = x - speedVar;
  }
}


void time () {
  textSize (40);
  fill (255);
  text (frameCount, 400, 100);
  if (frameCount == 600) {
    speedVar = speedVar+ 5;
    text(" Level 2", width/2, 100);
  }
  
  if (frameCount == 2000) {
    speedVar = speedVar+ 20;
    text(" Level 3", width/2, 100);
  }

  if (frameCount == 10000) {
    speedVar = speedVar+ 40;
    text(" Level 4", width/2, 100);
  }
}
/*
void contactEvent () {
for (int i = 0; i < ob1.length; i++) {
    ob1[i].fall ();
    
    if (ob1 [i] = x+PI*circleSize) {
      fill (0);
      rect (0,0,width, height);
      textSize (100);
      fill (255);
      text ("Sorry, try again!", width/2, height/2);
      noLoop();
    }
  }
}
*/



