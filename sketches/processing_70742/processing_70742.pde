
//Homework Assignment 4
//51257:A
//Copyright 2012 Patrick Clancy pjclancy@andrew.cmu.edu


float x, y, wd, ht;
color col;

void setup()
{
  size(400, 400);
  smooth();
  background(10, 83, 206);
  x=width*.5;
  y=height*.5;
  wd=random( 20, 140);
  ht=random( 20, 140);
 
}

void draw()
{
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

void keyPressed( )
{
  if ( key == ' ')  // [space bar] key
  
     background( random(255), random(255), random(255) );
 
  }


//saveframe("hw2.jpeg");

