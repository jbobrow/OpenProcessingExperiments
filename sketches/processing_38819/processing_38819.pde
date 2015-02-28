
//HW7.2, September 2011
//Copyright Manuela Kind, CMU Pittsburgh PA

//----------variables--------------

float x, y;         //postition
float dia;          //diameter
float veloX, veloY; //velocity x + y
color col;

//----------setup------------------

void setup()
{
  size  (400, 400);
  x = width/2;
  y = height/2;
  dia   = 50;
  veloX = 1;
  veloY = 1;
  col   = color(100, 150, 200, 90);
  smooth();
  noStroke();
}

//----------draw-------------------

void draw()
{
  backgr();
  bubble();
  moveBubbleX();
  moveBubbleY();
  increaseX();
  increaseY();
  decreaseX();
  decreaseY();
  keyPressed();
}

//-------------increaseY----------------

void increaseY()
{  if (frameCount > 50);

     if (mouseY > pmouseY)
      {
      float dif = 0.05*(mouseY - pmouseY);
      veloY = veloY + dif;
      }
}
void decreaseY()
{    if (mouseY < pmouseY)
     {
     float dif = 0.05*(pmouseY - mouseY);
     veloY = veloY - 2*dif;     
     }
 }
//-------------increaseX----------------

void increaseX()
{  if (frameCount > 50);

     if (mouseX > pmouseX)
     {
     float dif = 0.05*(mouseX - pmouseX);
     veloX = veloX + dif;
     }
}
void decreaseX()
{    if (mouseX < pmouseX)
     {
     float dif = 0.05*(pmouseX - mouseX);
     veloX = veloX - 2*dif;     
     }
}


//-----------moveBubbleX----------------

void moveBubbleX()
{
  x = x + veloX;

  if (x > width+dia/2)
  {
  x = -dia/2;
  }
  if (x < 0-dia/2)
  {
    x = width-dia/2;
  }
}

//-----------moveBubbleY----------------

void moveBubbleY()
{
  y = y + veloY;

  if (y > height+dia/2)
  {
    y = -dia/2;
  }
  if (y < 0-dia/2)
  {
   y = height-dia/2;
  }
}

//----------bubble---------------

void bubble()
{
  ellipse(x, y, dia, dia); 
  fill(col);

  ellipse(x, y, dia*0.75, dia*0.75); 
  fill(col);

  ellipse(x, y, dia/2, dia/2); 
  fill(col);

  ellipse(x, y, dia/4, dia/4); 
  fill(col);
}

//--------background---------------

void backgr()
{
  background(75, 100, 255, 20);
}

//---------------reset------------------

void keyPressed()

{ if (keyPressed == true)
 {
 pushMatrix();
 x = width/2;
 y = height/2;
 veloX = 0;
 veloY = 0;
 popMatrix();
 }
}

