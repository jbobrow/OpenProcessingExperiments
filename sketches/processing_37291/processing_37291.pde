
/* Made by Wilson Loi
Move mouse to create sparkles, click to apply blue paint
*/

float x1,y1;

void setup()
{
  size (500,500);
  smooth ();
  noStroke();
  background (0);
}

void draw()
{

  sparkles();
  fill (0, 0, random (255));
  if (mousePressed==true)
  {
    ellipse (x1,y1,random(100),50);
    x1=mouseX+random(-10,10);
    y1=mouseY+random(-10,10);
  }
}

void sparkles()
{
  fill (random(200,255));
  ellipse (x1,y1,random(50),random(50));
  if (mouseX<250)
  {  
    x1=mouseX*3;
  }
  if (mouseX*3>500)
  {  
    x1=mouseX*3-500;
  }
  if (mouseY<250)
  {  
    y1=mouseY*3;
  }
  if (mouseY*3>250)
  {  
    y1=mouseY*3-500;
  }
}

/*
  ellipse (x1,y1,random(50),random(50));
 x1=mouseX+random(-10,10);
 y1=mouseY+random(-10,10);
 
 if (mousePressed==true && mouseY>200)
 {
 ellipse (x1,y1,random(50),random(50));
 x1=mouseX+random(-10,10);
 y1=mouseY+random(-10,10);
 }
 */

