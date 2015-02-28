
/* Richard May rwmay@andrew.cmu.edu
 Copyright October 2012
 Do something interesting with while loops. Press any key to call 
 while loop. Click mouse to increase the Red value for next call of the while loop
 */


int x, col_1, y, z, col_2,col_3, opacity , buff;
int moveX, moveY;
float x2, y2, wd,ht,driver;

void setup ()
{
  noStroke();
  size (550, 550);
  smooth ();
  background(255);
  int x = 0;
  int col_1 = 0;
  int col_2 = 0;
  int y = x;
  opacity = 10;
  moveX = 0;
  moveY = 0;
  driver=0;
  col_3 = 0;
  buff = 10;
}

void draw ()
{
  whileLoop1();
 // whileLoop2();
  //stroke (.005);
  fill (255, 255, 255, 1);
  rectMode (CENTER);
  rect(mouseX, mouseY, random (.2*width, .5 * width), random(.2*height, .5 * height));
}
void keyPressed ()
{
  // if (keyCode == RIGHT)
  //{
    z=0;
    col_1 = 0;
    col_2=0;
    noStroke();
    whileLoop1();
  //}
}
void mouseClicked ()
{
 col_3 = col_3 + buff;
 if (col_3 > 255)
 {
   buff = -buff;
 }
 if (col_3 < 0)
 {
   buff = -buff;
 }
 // driver = 0;
  // whileLoop2();
}


//void whileLoop2()
//{
//  while (driver>12)
// { 
//   fill (255,0,0);
// rect (x2,y2,wd,ht); 
//  x2=mouseX;
//  y2 = mouseY;
//  wd = .5 * width;
//  ht = .7 * height;
//
//  driver=driver+1;
//}
  
//}


void whileLoop1()
{ 
  while (z < 12)
  {
    if (y > height)
    {
      y=0;
    }

    while (col_1 < width && x < width)
    {
      fill (col_3, col_1, col_2, opacity);
      rect (x, y, .4 * width, .4 * height);
      x = x + 2; 
      col_1 = col_1 + 1;
    }
    col_2 = col_2 + 20;
    col_1 = 0;
    x = 0;

    z = z + 1;
    y = y + 40;
  }
}



