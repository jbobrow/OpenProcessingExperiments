
//Josh Holloway
//jolloway.co.uk
//March 2013

int manx;
int many;

float manRate;
float manInc;

int xpos = 0;

void setup()
{
  size (500, 200);
  background (255);
  manRate = 1;
  manInc = 1;


  manx = 0;
  many = 100;
}
void draw()
{
  frameRate (manRate);  
  
  fill(255, 100);
  noStroke();
  rect (0, 0, width, height);

  stroke(0);
  if (manx % 3 == 0)
  {
    drawLegs3();
  }
  else if (manx % 3 == 1)
  {
    drawLegs1();
  }
  else
  {
    drawLegs2();
  }
  drawbody();
  
  manx += manInc;
  if(manRate < 1000)
  {
    manRate += 10;
  }

  if (manx > width)
  {
    manx = 0;
  }
}
void drawbody()
{
  line (manx, many, manx, many-40);
  ellipse (manx, many-50, 20, 20);
}
void drawLegs1()
{
  line (manx, many, manx, many + 40);
  line(manx, many + 40, manx + 5, many + 40);
  line (manx, many, manx - 5, many + 18);
  line (manx - 5, many + 18, manx - 15, many + 25);
  line (manx - 15, many + 25, manx - 15, many + 30);
  drawArms1();
}
void drawLegs2()
{
  line (manx - 5, many + 35, manx, many);
  line (manx - 5, many + 35, manx, many + 40);
  line (manx, many, manx + 20, many + 15);
  line (manx + 20, many + 15, manx +2, many + 30);
  line (manx + 2, many + 30, manx + 7, many + 32);
  drawArms2();
}

void drawLegs3()
{
  line(manx, many, manx + 15, many + 15);
  line(manx + 15, many + 15, manx + 20, many + 35);
  line(manx + 20, many + 35, manx + 25, many + 40);
  line(manx, many, manx - 5, many +15);
  line(manx - 5, many + 15, manx - 20, many + 35);
  line(manx - 20, many +35, manx - 15, many + 40);
  drawArms3();
}
void drawArms1()
{
  line(manx, many-30, manx + 15, many - 10);
  line(manx+15, many-10, manx + 25, many - 35);
  line(manx, many-30, manx-20, many - 15);
  line(manx-20, many-15, manx-23, many - 5);
}
void drawArms2()
{
  line(manx, many-30, manx+10, many-15);
  line(manx+10, many-15, manx+13, many-5);
  line(manx, many-30, manx-10, many-10);
  line(manx-10, many-10, manx-9, many-7);
}
void drawArms3()
{
  line(manx, many-30, manx+10, many-5);
  line(manx+10, many-5, manx+20, many-25);
  line(manx, many-30, manx-15, many-10);
  line(manx-15, many-10, manx-18, many-3);
}


