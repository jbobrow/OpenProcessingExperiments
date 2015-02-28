
//Nathan Trevino  
//Homework 7
//Processing Wednesday, September 20, 2011
//Copyright September 20th 2011
//Carnegie Mellon University. Pittsburgh PA

float i, j, diam, speedi, speedj;
PFont font;

//float speedi = map(mouseX, 0, 500, 0, 10);
//float speedj = map(mouseY, 0, 500, 0, 10);

PImage shell; //image

void setup() 
{

  font = loadFont("CourierNewPS-BoldMT-28.vlw");
  size(500, 500);
  smooth();
  noStroke();
  background(255);
  imageMode(CENTER);
  ellipseMode(CENTER);
  i = width/2;
  j = height/2;
  diam = 200;
  shell = loadImage("Green_Shell.png");
}

//------------------------------------
void draw() 
{
  //nothing but draw ---- in here!!
  backgrounder( );
  readout( );
  reference( );
  moveshell( );
  koopashell(i, j, .3);
}

//-------------------------------------

void koopashell(float x, float y, float s)
{
  translate(x, y);
  scale(s);
  image (shell, 0, 0);
}


//--------------------------------------


void reference()
{
  strokeWeight(3);
  stroke(0);
  ellipse(i, j, 175, 175);
}
//--------------------------------------


void moveshell( )
{

  float speedi = map(mouseX, 0, 500, 0, 25);
  float speedj = map(mouseY, 0, 500, 0, 25);


  //moving the x value
  i = i + speedi;
  if (i > width + diam/2)
  { 
    i = -diam/2;
  }

  if (i < -diam/2)
  {
    i = width + diam/2;
  }

  //moving the y value
  j = j + speedj;
  if (j > height + diam/2)
  { 
    j = -diam/2;
  }

  if (j < -diam/2)
  {
    j = height + diam/2;
  }

  // reset the shell
  if (keyPressed == true)
  {
    i = width/2;
    j = height/2;
  }
}


//-------------------------------------------




void backgrounder( )
{
  noStroke();
  fill(200, 30, 100);
  rect(0, 0, width, height);
}


//-------------------------------------------

void readout()
{
  fill(200, 30, 100);
  rect(0, 375, 600, 150);
  textFont(font);
  fill(255);
  text ( "vertical speed:" + speedi , 2, 400);
  text ( "horizontal speed:" + speedj, 2, 450);
  
}


