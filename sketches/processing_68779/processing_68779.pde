
//Homework 3
//Copyright 2012 Edmund Chow ezc@andrew.cmu.edu

float x, y, wd, ht, value;

void setup()
{
  size(400,400);
  smooth();
  background (255, 255, 255);
  x=100;
  y=100;
  wd=200;
  ht=200;
  int value = 0;
}

void draw()
{
  //Random Ellipses
  frameRate(30);
  strokeWeight(value);
  fill(random(200-255), random(255), random(255));
  ellipseMode(CENTER);
  ellipse(mouseX+random(wd*3), mouseY+random(ht*3), pmouseX, pmouseY);
}

void keyPressed()
{
  //Clears Background
  background(255);
}

void mousePressed()
{
  //Random White Ellipses
  noStroke();
  fill(255);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, pmouseX, pmouseY);
}

//saveFrame ("hw3.jpg");


  

