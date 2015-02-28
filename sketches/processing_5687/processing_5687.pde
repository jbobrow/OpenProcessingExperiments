
float r; //kleur rood
float b; //kleur blauw
float g; //kleur geel
float t; //transparence

int bolletje1_X; // functie van bolletje
int bolletje2_X;
int bolletje3_X;
int bolletje4_X;
int bolletje5_X;
int bolletje6_X;
int bolletje7_X;

int x; //grass
int vliegX; //vliegen

void setup ()
{
  size (400,400);
  smooth ();
  frameRate (30);
}
void draw ()
{
  background (0,0,255);
  bolletje1_X();
  bolletje2_X();
  bolletje3_X();
  bolletje4_X();
  bolletje5_X();
  bolletje6_X();
  bolletje7_X();
 
  int x = 0;
  for (int c = 255; c > 0; c-= 13)
  {
    fill (c);
    rect (x, 380,10,20);
    x = x + 20;
  }
  ellipseMode(CENTER); //vliegen
  fill (0);
  ellipse (mouseX,mouseY,20,20);
  ellipse (mouseX+30,mouseY+50,20,20);
  ellipse (mouseX-20,mouseY+30,20,20);
  fill (200);
  ellipse (mouseX-15,mouseY,25,10);
  ellipse (mouseX+15,mouseY,25,10);
  ellipse (mouseX+15,mouseY+50,25,10);
  ellipse (mouseX+45,mouseY+50,25,10);
  ellipse (mouseX-35,mouseY+30,25,10);
  ellipse (mouseX-5,mouseY+30,25,10);  
}
int x1 = 110;
int y1 = 290;
int speed = 1;
  
void bolletje1_X()
{
  y1 = y1 + speed;
  if (y1 > 310 || y1 < 290)
  {
    speed = speed *-1;
  }
  fill (45,190,50);
  ellipse (x1,y1,20,20);
}
int x2 = 130;
int y2 = 300;
int speed2 = 1;

void bolletje2_X()
{
  y2 = y2 - speed2;
  if (y2 < 300 || y2 > 310)
  { 
    speed2 = speed2 * -1;
  }  
  fill (30,200,60);
  ellipse (x2,y2,40,40); 
}
int x3 = 160;
int y3 = 320;
int speed3 = 1;
void bolletje3_X()
{
  y3 = y3 + speed3;
  if (y3 > 330 || y3 < 310)
  { 
    speed3 = speed3 * -1;
  }
  fill(30,180,20);
  ellipse(x3,y3,60,60);
}
void bolletje4_X() 
{ 
  int ellipseX= 200;
  int ellipseY= 200;
  
   if (mousePressed) 
  { 
    ellipseX = ellipseX + 100;
  }
  
  fill(150,200,50);
  ellipse(ellipseX,ellipseY,80,80);
  
  
}
void bolletje5_X()
{
  int ellipseX= 200;
  int ellipseY= 200;
  
  if (mousePressed)
  {
    ellipseX = ellipseX - 100;
  }
  
  fill (100,200,30);
  ellipse(ellipseX,ellipseY+60,80,80);
}
void bolletje6_X()
{
  int ellipseX= 200;
  int ellipseY= 200;
  
   if (mousePressed)
  { 
    ellipseX = ellipseX + 100;
  }
  
  fill (100,255,50);
  ellipse (ellipseX,ellipseY+120,80,80);
}

  int ellipseX = 200;
  int ellipseY = 200;
 
void bolletje7_X()
{ 
  fill(20,200,20);
  ellipse(ellipseX,ellipseY-80,100,100);
  fill (0,0,0);
  ellipse (ellipseX-20,ellipseY-140,10,50);
  fill (0,0,0);
  ellipse (ellipseX+20,ellipseY-140,10,50);
  r = random (255);
  b = random (255);
  g = random (255);
  t = random (20);
  fill (r,b,g);
  ellipse (ellipseX-30,ellipseY-110,30,30);
  ellipse (ellipseX+30,ellipseY-110,30,30);
}


