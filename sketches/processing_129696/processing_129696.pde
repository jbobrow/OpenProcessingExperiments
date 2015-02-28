
//copyright Laura Contero 2014
//Homework Assignment 3

//variable declarations
  float x, y;
  float w, h;
  float xDist, yDist;
  float easingCoef;

void setup()
{
  background( 246, 250, 53);
  size( 400, 400);
  noCursor();
  easingCoef = .3;
}

void draw()
{
  fill( 260, 260, 260, 130);
  noStroke();
  rectMode(CENTER);
  fill( 10, random( 60, 200), 150, 150);
  rect( x, y, .5*w, 2*h);
  rect( x, y, 2*w, .5*h);
  
  fill( 300, random( 20, 300), 0, 100); 
  rect( x, y, 2*w-x, h);
  rect( x, y, w, 2*h-y);
        
  xDist = mouseX-x;
  yDist = mouseY-y;
    
  x = x+xDist*easingCoef;
  y = y+yDist*easingCoef;
  w = 40;
  h = 40;
}


