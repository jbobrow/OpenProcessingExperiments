
// Oliver Haimson  alhaimso
// Homework 7
// Copyright 2012

// INSTRUCTIONS
// Move the Earth around with the mouse. Try to cause as many collisions with
// Mars as possible. If you go off the screen, your collision count goes
// back to zero. Get 20 collisions to win! Press any key to start over.

// Drawings of Earth and Mars taken from www.dragoart.com

// Mars variables
float x, y, wd, ht, deltaX, deltaY;
// Earth variables
float x2, y2, wd2, ht2, deltaX2, deltaY2;
boolean inBounds;
int collisionCount;
PImage mars, earth;

void setup()
{
  size(700, 700);
  smooth();
  mars = loadImage("mars.png");
  earth = loadImage("earth.png");
  wd=width/7;
  ht=height/7;
  x=random(width*.1+wd*.5, (width*.9-wd*.5));
  y=random(height*.1+ht*.5, (height*.9-ht*.5));
  deltaX=random(2, 5);
  deltaY=random(2, 5);
  wd2=width/7;
  ht2=height/7;
  x2=random(width*.1+wd2*.5, (width*.9-wd2*.5));
  y2=random(height*.1+ht2*.5, (height*.9-ht2*.5));
  deltaX2=random(2, 5);
  deltaY2=random(2, 5);
  inBounds=true;
  collisionCount=0;
}

void draw()
{
  background(30);
  drawStars();
  determineBounds();
  moveMars();
  moveEarth();
  drawBorder();
  checkCollision();
  showStats();
}

void drawStars() {
  stroke(240);
  strokeWeight(1.5);
  if (frameCount%5==0) {
    for (int i = 1; i<50; i++) {
      point(random(0, width), random(0, height));
    }
  }
}

void determineBounds() {
  if (x2 < width*.1 || x2 > width*.9 || y2 < height*.1 || y2 > height*.9) {
    inBounds=false;
  }
  else {
    inBounds=true;
  }
}

void moveMars()
{
  image(mars, x-wd*.5, y-ht*.5, wd, ht);
  x=x+deltaX;
  y=y+deltaY;
  if (x>(width*.9-wd*.5) || x<(width*.1+wd*.5))
  {
    deltaX=-deltaX;
  }
  if (y>(height*.9-ht*.5) || y<(height*.1+ht*.5))
  {
    deltaY=-deltaY;
  }
}

void moveEarth()
{
  image(earth, x2-wd2*.5, y2-ht2*.5, wd2, ht2);
  // wrapping
  if (x2>=width*.9) {
    x2-=width*.8;
    collisionCount=0;
  }
  if (x2<=width*.1) {
    x2+=width*.8;
    collisionCount=0;
  }
  if (y2>=height*.9) {
    y2-=height*.8;
    collisionCount=0;
  }
  if (y2<=height*.1) {
    y2+=height*.8;
    collisionCount=0;
  }
  // determine direction to move and move
  if ((pmouseX<mouseX || mouseX>x2) && inBounds) {
    x2+=deltaX2;
  }
  if ((pmouseX>mouseX || mouseX<x2) && inBounds) {
    x2-=deltaX2;
  }
  if ((pmouseY<mouseY || mouseY>y2) && inBounds) {
    y2+=deltaY2;
  }
  if ((pmouseY>mouseY || mouseY<y2) && inBounds) {
    y2-=deltaY2;
  }
  // to make the movement a little more tricky
  if (abs(pmouseX-mouseX)>width*.05 || abs(pmouseY-mouseY)>height*.05) {
    deltaX2++;
    deltaY2++;
  }
}

void drawBorder() {
  noStroke();
  fill(13, 55, 82);
  rect(0, 0, width*.1, height);
  rect(width*.9, 0, width*.1, height);
  rect(0, 0, width, height*.1);
  rect(0, height*.9, width, height*.1);
}

void checkCollision()
{
  float d = dist(x, y, x2, y2);
  if (d < wd)
  {
    collision();
  }
}

void collision()
{
  collisionCount+=1;
  // border
  fill(0);
  noStroke();
  rect(0, 0, width*.1, height);
  rect(width*.9, 0, width*.1, height);
  rect(0, 0, width, height*.1);
  rect(0, height*.9, width, height*.1);
  // collision text
  fill(227, 27, 0);
  textSize(30);
  textAlign(CENTER);
  text("Collision!", width*.5, height*.07);
  textSize(12);
  text(collisionCount + " collisions", width*.5, height*.98);
  text(collisionCount + " collisions", width*.501, height*.98);
  text(collisionCount + " collisions", width*.499, height*.98);
  // move Mars to a random location
  x=random(width*.1+wd*.5, width*.9-wd*.5);
  y=random(height*.1+ht*.5, height*.9-ht*.5);
  // reset all the speeds to a random value
  deltaX=random(2, 5);
  deltaY=random(2, 5);
  deltaX2=random(2, 5);
  deltaY2=random(2, 5);
  // check if the player has won
  if (collisionCount==20) {
    win();
  }
}

void win() {
  noLoop();
  // draw stars
  stroke(240);
  strokeWeight(1.5);
  for (int i = 1; i<50; i++) {
    point(random(0, width), random(0, height));
  }
  // draw winning text
  textSize(60);
  text("YOU WIN!", width*.5, height*.5);
}

void showStats()
{
  fill(100);
  textSize(12);
  textAlign(CENTER);
  text(millis()/1000 + " seconds", width*.5, height*.94);
  text(collisionCount + " collisions", width*.5, height*.98);
}

void keyPressed() {
  setup();
  loop();
}


