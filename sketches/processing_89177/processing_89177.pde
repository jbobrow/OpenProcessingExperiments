
int x = 100;
int y = 100;
int z = 0;
void setup()                              //sets up size and determines how fast the program runs
{
  size(200,200);
  frameRate(10);
}

void draw()
{ 
  drawFace();                              //drops into the drawFace function
 
  if((mouseX > 90) && (mouseX < 110))      //if  the position of mouseX is within these conditions,
  {                                        //then it drops into the animateFaceRight function which
    background(255,60,200);                       //moves the whole face right.
    animateFaceRight();
  }
  x = x + 1;                                //adds 1 onto x which moves face along x axis
 
}

void drawFace()                              //draw face function
{
  background(100,100,255);
  fill(255,255,0);
  ellipse(100,100,140,140);
  fill(255,0,0);
  ellipse(130,65,30,30);
  ellipse(75,65,30,30);
  fill(0,255,0);
  rect(75,120,50,20);
}


void animateFaceRight()                      //animateface function
{
  z = z + 1;
  if ( z > 9)
   z = z * -1;
  fill(255,255,0);
  ellipse(x,y,140+z,140);
  fill(255,0,0);
  ellipse(x + (30+z),y - 35,30,30+ z -1);
  ellipse(x - (25-z),y - 35,30,30+z);
  fill(0,0,255);
  ellipse(x - 10,y + 40,50,20+z);
}
