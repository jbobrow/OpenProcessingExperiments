
//Homework 4, September 2011
//Copyright Manuela Kind, CMU Pittsburgh PA 15289, USA


//---------------variables----------------

int x;   //positionX
int y;   //positionY
int ht;  //height
int wd;  //width
int a;   //stroke
color col;
color col2; //color
//-----------------setup------------------
void setup ()
{
  //variables
  x = 200;
  y = 200;
  ht = 300;
  wd = 300;
  a = 1;
  col = color (160, 230, 230);
  //general
  size (400, 400);
  background(255);
  smooth();
  ellipseMode(CENTER);
  noCursor();
}

//-------------draw---------------------
void draw()
{
  background(255);
  // initials(x,y,wd,ht,a, col);
}

//-----------mouseMoved-------------------
void mouseMoved() 
{
  x = mouseX;  
  y = mouseY;
  col = color (random (256), random(256), random(256));
  //----------rotate initials-------------
  //  while (mouseMoved = true)
  {
    translate (mouseX, mouseY); 
    rotate(radians(frameCount));
    initials(0, 0, wd/2, ht/2, a, col);
  }
}



