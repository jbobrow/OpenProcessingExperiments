
boolean b;
PImage b1;
PImage t1;

Rectangle r1;
Ornaments o1;
Boy b2;


void setup()
{
  size(500, 500);
  background(255);
  r1 = new Rectangle();
  o1 = new Ornaments();
  b2 = new Boy();
  b1 = loadImage("cartoon1.png"); 
  t1 = loadImage("tree4.png");
}

void draw()
{
  if (b == false)
  {
  background(255);
  r1.drawRectangle();
  o1.drawOrnaments();
  fill(255,255,0);
  rect(100,440,60,60);
  fill(0);
  rect(100,470,60,10);
  rect(125,440,10,60);
  fill(0,0,250);
  rect(300,420,80,80);
  fill(0);
  rect(300,460,80,10);
  rect(335,420,10,80);
  fill(100,0,100);
  rect(400,460,40,40);
  fill(0);
  rect(400,480,40,5);
  rect(417.5,460,5,40);
  b2.drawBoy();
  if (keyPressed) //idea of movement from asteroids
  {
  if (keyCode == LEFT)
  {
    b2.updateLeft();
  }
  if (keyCode == RIGHT)
  {
    b2.updateRight();
  } //end
 }
}
  if (b == true)
  {
    size(500,500);
    background(0);
    for(int i = 0; i < 10000; i++) //borrowed and slightly modified
    {
    float x = random(width);
    float y = random(height);
    color c = t1.get(int(x),int(y));
    fill(c);
    noStroke();
    ellipse(x,y,5,5); //end of borrowed code
  }
 }
}

class Rectangle
{
  int height;
  int width;
  int posx;
  int posy;
  color c;


Rectangle()
{
  height = 50;
  width = 50;
  posx = 225;
  posy = 450;
  c = color(0, 100, 0);
}

Rectangle (int h, int w, int px, int py, color c1)
{
  height = h;
  width = w;
  posx = px;
  posy = py;
  c = c1;
}

void drawRectangle()
{
  fill(139,69,19);
  rect(posx, posy, height, width);
  fill(c);
  rect(posx-175, posy-50, height*8, width);
  rect(posx-150, posy-100, height*7,width);
  rect(posx-125, posy-150, height*6,width);
  rect(posx-100, posy-200, height*5,width);
  rect(posx-75, posy-250, height*4,width);
  rect(posx-50, posy-300, height*3,width);
  rect(posx-25, posy-350, height*2,width);
  rect(posx, posy-400, height,width);
 }
}

class Ornaments
{
  int size;
  int posx;
  int posy;
  color c;

Ornaments()
{
  size = 20;
  posx = 250;
  posy = 260;
  c = color(100,0,0);
}

Ornaments (int s, int px, int py, color c1)
{
  size = s;
  posx = px;
  posy = py;
  c = c1;
}

void drawOrnaments()
{
  fill(c);
  ellipse(posx,posy+10,size,size);
  ellipse(posx-25,posy-90,size,size);
  ellipse(posx+25,posy-90,size,size);
  ellipse(posx-50,posy+55,size,size);
  ellipse(posx-75,posy+105,size,size);
  ellipse(posx-100,posy+155,size,size);
  ellipse(posx+25,posy-45,size,size);
  ellipse(posx+50,posy+105,size,size);
  ellipse(posx+75,posy+155,size,size);
  ellipse(posx+100,posy+175,size,size);
  ellipse(posx,posy+175,size,size);
  ellipse(posx,posy+125,size,size);
  ellipse(posx-95,posy+70,size,size);
  ellipse(posx+50,posy+70,size,size);
  ellipse(posx-60,posy+5,size,size);
  ellipse(posx+55,posy+5,size,size);
  ellipse(posx-55,posy-35,size,size);
  ellipse(posx-25,posy-135,size,size);
  ellipse(posx+25,posy-135,size,size);
  ellipse(posx,posy-180,size,size);
 }
}

class Boy
{
  int posx;
  int posy;
  int size;
  
Boy()
{
  posx = 0;
  posy = 400;
  size = 100;
}

Boy(int px, int py, int s)
{
  size = s;
  posx = px;
  posy = py;
}

void drawBoy()
{
  b1 = loadImage("cartoon1.png");
  image(b1,posx,posy,100,100);
}

void updateRight()
{
  posx = posx + 3;
}
 
void updateLeft()
{
  posx = posx - 3;
 }
}

void keyPressed()
//corresponds to the boolean and allows me to change the background by hitting space
{
  b = false;
  if (key == ' ')
  {
    b = true;
  }
}












