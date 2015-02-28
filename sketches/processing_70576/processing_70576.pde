
//Homework Assignment 2
//51257:A
//Copyright 2012 Patrick Clancy pjclancy@andrew.cmu.edu


float x, y, wd, ht;
color col;

void setup()
{
  size(400, 400);
  smooth();
  x=width*.5;
  y=height*.5;
  wd=50;
  ht=50;
  col = color(45,50,130);
}

void draw()
{
  background(10, 83, 206);
  
  fill(mouseX, 130);
  noStroke();
  ellipseMode(CENTER);
  ellipse(x, y, x*.3, y*.4);
  
  fill(mouseX, 20);
  ellipse(x*.5, y*.5, x*.025, y*.025);
  
  fill(mouseX, 145);
  rect(x*3, y*5, x*.5, y*.5);
  
  stroke(0, 0, 0);
  strokeWeight(7);
  fill(col);
  ellipse(mouseX+random(wd*2), mouseY+random(ht*5), pmouseX+2, pmouseY+1);

  stroke(30, 20, 240);
  strokeWeight(2);
  fill(random(col));
  ellipse(mouseX, mouseY+random(ht*.5), pmouseX+4, pmouseY+4);
}

//saveframe("hw2.jpeg");

