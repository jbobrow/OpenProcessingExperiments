
//Laura Laham
//Homework # 3
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise without prior written permission of Laura Laham

PImage spaceship, spaceshipStartScreen, asteroidBounce, asteroidWrap, asteroid2Wrap;
PFont font;
float xspeed, yspeed, x, y, x2, y2, x2speed, y2speed, x3, y3, x3speed;
int numHits;
int pmillis;
boolean hitOnce;
int k = 0;

void setup() {
  size(400, 400);
  background(0);
  font = loadFont("Helvetica-Bold-24.vlw"); 
  textFont(font); 
  spaceship = loadImage("spaceship1.png");
  spaceship.resize(100, 40);
  spaceshipStartScreen = loadImage("spaceship2.png");
  asteroidBounce = loadImage("Asteroid.png");
  asteroidBounce.resize(50, 20);
  asteroidWrap = loadImage("Asteroid.png");
  asteroidWrap.resize(50, 25);
  xspeed = random(1, 3);
  yspeed = random(1, 3);
  x2speed = random(1, 3);
  y2speed = random(1, 3);
  x = random(100, width-100);
  y = random(100, height-100);
  x2 = random(100, width-100);
  y2 = random(100, height-100);
  numHits = 0;
  hitOnce = false;
  x3 = random(0, width);
  y3 = (4*height)/5;

  for (int i = 0; i < 1000; i++)
  {
    noStroke();
    fill(255);
    ellipse(int(random(0, width)), int(random(0, height)), 1, 1);
  }
  image(spaceshipStartScreen, width/10, height/10);
    stroke(255);
  String st = "Use the r-l arrow keys to move";
  String st2 = "Get over 100 hits and game over!";
  text(st, 15, 50);
  text(st2, 15, 100);
}

void draw() {
  while (k<90000){
  showStart();
  k++;}
  boolean start = false;
  if (mousePressed)
  {
    start = true;
  }
  if (start = true) {
    startGame();
  }
}

void showStart() {
  String s = "Click mouse to play";
  text(s, 15, 50);
}

void startGame() {
  background(0);
  insertBouncingAsteroid();
  insertWrappingAsteroid();
  checkCollision();
  insertSpaceship();
  checkSpaceship();
  checkNumHits();
}

void checkNumHits() {
  text("Hits:" + numHits, width-80, height-10); 
  if (numHits > 100) {
    background(0);
    for (int i = 0; i < 1000; i++)
    {
      noStroke();
      fill(255);
      ellipse(int(random(0, width)), int(random(0, height)), 1, 1);
    }
    noLoop();
    image(spaceshipStartScreen, width/10, height/10);
    numHits = 0;
    String st = "game over";
    text(st, 15, 50);
  }
}



void checkSpaceship() {

  float b = dist(x, y, x3, y3); 
  if (b < 40) {
    if (xspeed > 0)
      xspeed -= 2;
    else if (xspeed<0)
      xspeed += 2;

    xspeed = -xspeed; 
    noTint();
    numHits++;
  }


  float c = dist(x2, y2, x3, y3); 
  if (c < 40) {
    if (x2speed > 0)
      x2speed -= 2;
    else if (x2speed<0)
      x2speed += 2;
    x2speed = -x2speed;
    noTint();

    numHits++;
  }
}






void insertSpaceship() {
  image(spaceship, x3, y3);

  if (keyPressed && key == CODED)    
  {
    if (keyCode == RIGHT && x3+100 < width) {    
      x3 = x3+2;
    }
    else if (keyCode == LEFT && x3>0)
    {
      x3 = x3-2;
    }
  }
}


void checkCollision() {
  float d = dist(x, y, x2, y2);
  if (d< 50) {
    if (xspeed > 0)
    {
      xspeed--;
    }
    else if (xspeed < 0)
    {
      xspeed++;
    }
    xspeed = -xspeed; 
    if (x2speed > 0)
    {
      x2speed--;
    }
    else if (x2speed < 0)
    {
      x2speed++;
    }
    x2speed = -x2speed;
  }
}


void insertWrappingAsteroid() {
  image(asteroidWrap, x2, y2);
  x2 = x2+ x2speed;
  y2 = y2+ y2speed;
  checkWrap();
}


void checkWrap()
{
  if (x2 > width) {
    x2 = 0-x2;
  }

  if (y2> height) {
    y2 = 0;
  }

  if (x2 < 0) {
    x2 = width+x2;
  }

  if (y2< 0) {
    y2 = height;
  }
}


void insertBouncingAsteroid() {
  image(asteroidBounce, x, y);
  x=x+xspeed;
  y = y+yspeed;
  checkEdge(x, y);
}


void checkEdge(float x, float y) {
  if (x + 50 > width || x<0) {
    xspeed = -xspeed;
  }

  if (y + 30> height || y < 0) {
    yspeed = -yspeed;
  }
}

//spaceship image accredited to original artist: http://www.psychoform.com/htmlgallery/spaceship.htm


