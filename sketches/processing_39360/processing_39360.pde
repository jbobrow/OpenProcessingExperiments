
/**
 * 
 * by James Liu 
 *
 **/

Flat a,b,j;

void setup()
{
  size(700, 300);
  smooth();
  noStroke();

  a = new Flat();
  a.x = 0;
  a.y = 50;
  a.w = 60;
  a.h = 10;
  a.C = #F1FA32;
  
  b = new Flat();
  b.x = 0;
  b.y = 200;
  b.w = 60;
  b.h = 10;
  b.C = #F1FA32;

  j = new Flat();
  j.x = 0;
  j.y = 125;
  j.w = 60;
  j.h = 10;
  j.C = #F1FA32;
 
}

void draw()
{

  background(0);

  a.move();
  b.move();
  j.move();
  a.show();
  b.show();
  j.show();
}

class Flat
{
  int x, y, w, h;
  int C;

  void show()
  {
    fill(C);
    rect(x, y, w, h);
    if (x>150)
    {
     C = #FA0032;
    }
    
    if (x<150)
    {
     C = #F1FA32;
    }
    
    if (j.x>150)
    {
      j.C = #426DEA;
      j.y = 95;
      j.h = 60; 
    }
    
    if (j.x<150)
    {
      j.C = #F1FA34;
      j.y = 125;
      j.h = 10; 
    }

    if (j.x>300)
    {
      j.w = 20;
      j.h = 20;
      j.y = 120;
      j.C = #0EED44;
    }
    
    if (j.x>450)
    {
      j.y = 125;
      j.w = 60;
      j.h = 10;
      j.C = #F1FA32;  
  }

}


  void move()
  {
    x=x+10;

    if (x>700)
    {
      x=0;
    }
  }
}



