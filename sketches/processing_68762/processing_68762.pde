
//Gloriana Gonzalez
//gloriang@andrew.cmu.edu
//Homework #3
//Copyright Gloriana Gonzale, Pittsburgh, August 2012

float x, y, w, h;
color col;
//Setup sets the stage
//Size must be first command

void setup()
{
  size(400, 400);
  smooth();
  x=width*.25;
  y=height*.25;
  w=50;
  h=50;
  col = color(255,255,255);
  //color c1 = color(255, 255, 255);
  //color c2 = color( 255, 255, 255);
  //color c3 = color (255, 255, 255);
  
}

void draw ()
{
  println(frameCount);
  background(160,10,50);
  
//Background

noFill();
noStroke();
rectMode(CENTER);
fill(mouseX, 70);
rect(x*2.0, y*2.0, x*1.5, y*1.5);

fill(mouseX, 60);
rect(x*2.0, y*2.0, x*2.5, y*2.5);

fill(mouseX, 50);
rect(x*2.0, y*2.0, x*3.5, y*3.5);
 
//Moving object properties 
 stroke(255,255,255);
 strokeWeight(2);
 fill(col);
  
//Vertical movement 
  rect(x*.25, frameCount%height, w, h);
  
  rect(x*.75, (2*frameCount)%height, w, h);
  
  rect(x*1.25, (3*frameCount)%height, w, h);
  
  rect(x*1.75, (4*frameCount)%height, w, h);
  
  rect(x*2.25, (5*frameCount)%height, w, h);
  
  rect(x*2.75, (6*frameCount)%height, w, h);

//horizontal movement

 rect(frameCount%width, y*.25, w, h);
  
 rect((2*frameCount)%height,y*.75, w, h);
  
 rect((3*frameCount)%height, y*1.25, w, h);
  
 rect((4*frameCount)%height, y*1.75, w, h);
  
 rect((5*frameCount)%height, y*2.25, w, h);
  
 rect((6*frameCount)%height, y*2.75, w, h);
   
}

//change the size of the ellipse when mouse is clicked

void mouseClicked()
{
  w = random(20,60);
  h = random(20,60);
  col = color(random(255),random(255),random(255));
}



