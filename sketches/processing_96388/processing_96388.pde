
GameChip myChip;
PImage myImage;
boolean newcircle, newcircle2, newcircle3 = false;
boolean newcircle4, newcircle5, newcircle6, newcircle7 = false;
int state = 1;

void setup()
{
  size (700,700);
  myChip = new GameChip();
  myImage = loadImage ("connectfour.png");
  
}

void draw ()
{
  background(0,0,255);
  image (myImage, 200, 0, 300, 20);
  myChip.display();
  for (int col = 0; col <= 700; col = col + 100)
  {
    for (int row = 100; row <= 600; row = row + 100)
    {
     stroke(167,167,206);
     strokeWeight(3);
     fill (0,0, 255);
     rect (col, row, 95, 95);
    }
  } 
  
  if (state == 1)
  {
    fill(255, 0, 0);
  }
  if ( state == 2)
  {
    fill (0);
  }
  
  if (newcircle)
  {
    int x = 50;
    int y = 650;
    ellipse (x, y, 90, 90);
  }
  if (newcircle2)
  {
    int x = 150;
    int y = 650;
    ellipse (x, y, 90, 90);
  }
  if (newcircle3)
  {
    int x = 250;
    int y = 650;
    ellipse (x, y, 90, 90);
  }
  if (newcircle4)
  {
    int x = 350;
    int y = 650;
    ellipse (x, y, 90, 90);
  }
  if (newcircle5)
  {
    int x = 450;
    int y = 650;
    ellipse (x, y, 90, 90);
  }
  if (newcircle6)
  {
    int x = 550;
    int y = 650;
    ellipse (x, y, 90, 90);
  }
  if (newcircle7)
  {
    int x = 650;
    int y = 650;
    ellipse (x, y, 90, 90);
  }
}

class GameChip
{
  color r;
  float ypos;
  float x2pos;
  float y2pos;
  
  GameChip()
  {
    r = color(255,250,90);
    ypos = 50;
    x2pos = 90;
    y2pos = 90;
    
  }
  
  void display ()
  {
    fill (r);
    ellipse (mouseX, ypos, x2pos, y2pos);
  }
}

void mousePressed()
{
  if (mouseX > 0 && mouseX < 100)
 {
   newcircle = true;
 }
 if (mouseX > 100 && mouseX < 200)
 {
   newcircle2 = true;
 }
 if (mouseX > 200 && mouseX < 300)
 {
   newcircle3 = true;
 }
   if (mouseX > 300 && mouseX < 400)
 {
   newcircle4 = true;
 }
 if (mouseX > 400 && mouseX < 500)
 {
   newcircle5 = true;
 }
 if (mouseX > 500 && mouseX < 600)
 {
   newcircle6 = true;
 }
 if (mouseX > 600 && mouseX < 700)
 {
   newcircle7 = true;
 }
 
 state ++;
 if (state > 2)
 {
   state = 1;
 }
 
}




