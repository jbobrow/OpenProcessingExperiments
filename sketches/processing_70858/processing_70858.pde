
/*
Assignment 2
Name: Jenny Mott
E-mail: jmott@brynmawr.edu
Course: CS 110 - Section 01
Submitted: 9/18/2012

So i'm hoping this comes out looking kind of like a storm.
But, a colorful storm.
*/
float r;
float g;
float b;
float a;
float x;
float y1;
float y2;
float h;

void setup() {
  size(500,500);
  background(8,30,49);
//let's put a horizon line in there
  rectMode(CORNER);
  fill(7,14,21);
  rect(0,350,500,350);
}
void draw() {
//let's draw some clouds
  ellipseMode(CENTER);
  float w = 300;
    while(w>=50) {
      noStroke ();
      fill(255-w);
    ellipse(250,10,w,w/6);
    ellipse(125,15,w,w/6);
    ellipse(375,15,w,w/6);
    w = w-5;
    }
//let's see if this will make the rain colorful
  r = random(225);
  g = random(255);
  b = random(255);
  a = random(225);
  x = random(width);
  y1 = random(height);
  y2 = random(x + 30);
  stroke(r,g,b,a);
  line(x,y1,x,y2);
}
void keyPressed() {
//this should hopefully clear or reset or whatever
  size(500,500);
  background(8,30,49);
  rectMode(CORNER);
  fill(7,14,21);
  rect(0,350,500,350);
}
void mousePressed() {
//so i guess clouds if you click up high, and hail if you click lower?
  if(mouseY < 100) {
    float w = 300;
    while(w>=50) {
      noStroke ();
      fill(255-w);
    ellipse(mouseX,mouseY,w,w/6); 
    w = w-5;
    }
  }else {
  h = random(20);
  stroke(0);
  fill(185,212,234);
  rectMode(CENTER);
  rect(mouseX,mouseY,h,h);
  }
}
