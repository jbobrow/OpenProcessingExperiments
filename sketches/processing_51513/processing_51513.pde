
//assignment 6
//Mi Jin Hwang copyright 2012
  
float x, y, d;
float r, g, b;
float xSpeed, ySpeed;
  
void setup()
{
 size(450, 400);
 smooth();

 frameRate(25);
 x = random(0, width);
 y = random(0, height);
 d = 50;
  
 drawPig (mouseX, mouseY, (mouseX+mouseY)*0.4);
  
 xSpeed = 2;
 ySpeed = 2;
   
 r = 190;
 g = 200;
 b = 211;
}

void draw(){
prepWindow ();

drawPig (x, y, d);
movePig();
}

void drawPig (float x, float y, float d)
{
fill (252, 110, 250, 80);
ellipse (x, y, d, d);
fill (193, 123, 47, 50);
ellipse (x, y*1.03, d*0.3, d*0.3);

fill (0);
ellipse (x-10, y-10, d*0.05, d*0.05);
fill (0);
ellipse (x+10, y-10,d*0.05, d*0.05);

fill(240,230,223,80);
ellipse (x-2,y+7,d*0.05, d*0.08);
fill(240,230,223,80);
ellipse (x+2, y+7,d*0.05, d*0.08);

fill (252, 110, 250, 80);
ellipse (x-20,y-20,d*0.2,d*0.2);
fill (252, 110, 250, 80);
ellipse (x+20, y-20, d*0.2, d*0.2);

fill (252, 194, 196);
bezier (350, 355, 330, 320, 370, 320, 350, 355);
bezier (350, 355, 330, 390, 370, 390, 350, 355);
bezier (350, 355, 315, 335, 315, 375, 350, 355);
bezier (350, 355, 385, 335, 385, 375, 350, 355);

}


void prepWindow()
{
  fill(234, 223, 116, 60);
  rect(0, 0, width, height);
}
 
void movePig()
{
  x = xSpeed + x;
     
  if (x > width-d)
  {
    xSpeed = -xSpeed;
  }
   
  else if (x < 0)
  {
    xSpeed = -xSpeed;
  }
   
  y = y + ySpeed;
   
  if (y > height -d)
  {
    ySpeed = -ySpeed;
  }
   
  else if (y < 0)
  {
    ySpeed = -ySpeed;
  }
}

