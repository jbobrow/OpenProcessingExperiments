
/**
 * Repetition and variation by Mei Deng
 * Press arrow keys to change speed!
 *
 **/


Poop a, b, c, d, e, f;
boolean upPressed, downPressed, leftPressed, rightPressed;

void keyPressed()
{
  if (keyCode == UP) upPressed = true;
  if (keyCode == DOWN) downPressed = true;
  if (keyCode == LEFT) leftPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
}



void setup()
{
  size (600, 600);
  background (#78F2EF);
  smooth();
  noStroke();
  upPressed = downPressed = leftPressed = rightPressed = false;

  a = new Poop();
  b = new Poop();
  c = new Poop();
  d = new Poop();
  e = new Poop();
  f = new Poop();

  a.r = 70;
  b.r = 45;
  c.r = 50;
  d.r = 55;
  e.r = 60;
  f.r = 60;

  a.v = 80;
  b.v = 10;
  c.v = 10;
  d.v = 10;
  e.v = 10;
  f.v = 10;

  a.x = 0;
  b.x = 100;
  c.x = 200;
  d.x = 300;
  e.x = 400;
  f.x = 500;

  a.y = 0;
  b.y = 100;
  c.y = 200;
  d.y = 300;
  e.y = 400;
  f.y = 500;


  //a.c = (#FFBDB2);  //biggest
  b.c = (#1F1F1F);  //left
  c.c = (#767676); // 2 from left
  d.c = (#A5A3A3);  //3 from left
  e.c = (#D3D3D3);  //4
  f.c = (#F5BCBC); //

  // a.s = 1;
  // b.s = 2;
  // c.s = 3;
  // d.s = 4;
  // e.s = 5;
}

void draw()
{
  background (#670505);


  if (upPressed)
  {
    c.y = c.y + 60;
  }
  if (downPressed)
  {
    b.y = b.y + 60;
  }
  if (leftPressed)
  {
    d.y = d.y + 60;
  }
  if (rightPressed)
  {
    e.y = e.y + 60;
  }
  if (rightPressed)
  {
    e.y = e.y + 60;
  }


  a.move();
  b.move();
  c.move();
  d.move();
  e.move();
  f.move();
  a.show();
  b.show();
  c.show();
  d.show();
  e.show();
  f.show();
  // ellipse(10, 10,random(height, width), random(height, width));
} 

class Poop
{
  float x, y, w, h;
  int r; // size (r for radius)
  int v; // velocity
  int c; // color
  int s; // strokeWeight
  boolean upPressed, downPressed, leftPressed, rightPressed;

  void show()
  {
    fill(c); 
    strokeWeight(s);
    strokeWeight(40);
    line(0, 100, 600, 100);
    rect (x, y, r, r);
  }



  void move()
  {
    x = x + 0;
    if (x > width) 
    {
      x = 0;
    }
    y = y + v;
    if (y > height) 
    {
      y = 0;
    }
  }
}


