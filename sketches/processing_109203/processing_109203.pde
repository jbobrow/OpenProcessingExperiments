
// Homework #3
//© Eden Weingart 2013
// eweingart@andrew.cmu.edu

float x, y, wd, ht;
color col;
PImage pic;
PImage pic1;


void setup ()
{
  size (400, 400);
  smooth ();
  rectMode(CENTER);
  col= color (200, 200, 100);
  pic= loadImage ("0001.png");
  pic1= loadImage ("clear.png");
}

void draw ()
{ background (pic1);
  saveFrame ("0001.png");
  background (pic);
  fill (255, 255, 255, 15);
  noStroke();
  rect (200, 200, 400, 400);
  fill (col);
  stroke(0);
  strokeWeight(2);
  line (200, 200, mouseX, mouseY);
  noStroke();
  ellipse (mouseX, mouseY, 35, 35);
  fill(0);
  ellipse(200, 200, 13, 13);
  fill(col);
}

void mousePressed ()
{
  saveFrame ("0001.png");
  //  background (pic);
  pic= loadImage ("0001.png");
  col=color (random(255), random(255), random(255));
  ellipse (mouseX, mouseY, 35, 35);
}



