
Leaf[] l;
PImage rock;
PImage leaf;
boolean left, right;

void setup()
{

  rock = loadImage("rocks.jpg");
  leaf = loadImage("maple leaf.gif");
  
  l = new Leaf[30];
  for(int i=0; i<l.length; i++)
  {
    l[i] = new Leaf();
    l[i].x = random(10,450);
    l[i].y = random(0,500);
    l[i].s = (int)random(40,90);
    l[i].v = (int)random(1,4);
  }
  
  size(600,600);
  smooth();
  stroke(0);
}
void draw()
{
  rock();
  for(int i=0; i<l.length; i++)
  {
    l[i].move();
    l[i].show();
  }
}
void rock()
{
  tint(0, 153, 204, 126);
  image(rock,0,0,width,height);
}

class Leaf
{
   float x, y;
   int s,v;
   
   void show()
   {
     image(leaf,x,y,s,s);
     
     if (y > height + x) {y = 0 - s;}
     if (x > width + x){x = 0 - x;}
     if (x < 0 - x){x = width + x;}
     
     if (keyPressed && keyCode == LEFT){x -= 10;}
     if (keyPressed && keyCode == RIGHT){x += 10;}
   }
   void move()
  {
    y += (height/2) * 0.01 * v;
  }
}

