
//copyright Laura Contero 2014
//Homework Assignment 4

//mousePressed (left button) creates a white ellipse which changes size as it follows the cursor;
//mousePressed (right button) creates a black ellipse which also chanes size as it follows the cursor;
//keyPressed alters the background to black;
//mouseWheel alters the background to white;

//variable declarations
  float x, y;
  float w, h;
  float xDist, yDist;
  float easingCoef;

void setup()
{
  background( 0, 0, 0);
  size( 400, 400);
  noCursor();
  easingCoef = .1;
}

void draw()
{
  noStroke();          
  ellipseMode(CENTER);
  
  //vertical ellipses
  fill( 255, 0, 255, 10);
  ellipse( 10*w-x, y, 3*w, 2*h);
    
  fill( 0, 255, 255, 10); 
  ellipse( x, y, 3*w, 2*h);
  
  //horizonal ellipses
  fill( 0, 255, 0, 10); 
  ellipse( x, 10*h-y, 3*w, 2*h);
  
  fill( 255, 255, 0, 10); 
  ellipse( 10*w-x, 10*h-y, 3*w, 2*h);
        
  xDist = mouseX-x;
  yDist = mouseY-y;
    
  x = x+xDist*easingCoef;
  y = y+yDist*easingCoef;
  w = 40;
  h = 40;
}

void mousePressed() 
{
  if (mouseButton == LEFT) 
  {
    fill( 255); 
  } else {
    fill( 0);
  }
    ellipse( x, y, 3*w-.25*x, 3*h-.5*y);
}

void keyPressed() 
{
  background( 0);
  frameRate( 50);
}

void mouseWheel( MouseEvent event)
{
  background( 255);
  frameRate( 50);
}


