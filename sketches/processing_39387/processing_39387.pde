
/*
*By Timothy Yue
 *Cubes move on their own
 *You can drag around the cubes
 *Press space to change from cube to spheres
 */


import processing.opengl.*;

Cube a, b, c;
float inc = 0;

boolean squares = true;
boolean circles = false;

void setup()
{
  size(800, 800, OPENGL);
  smooth();

  a = new Cube();
  a.X = width/2;
  a.Y = height/2;
  a.r = 100;
  a.speed = random(-5, 5);
  a.speed2 = random(-5, 5);
  a.f = 180;

  b = new Cube();
  b.X = 100;
  b.Y = 100;
  b.r = 50;
  b.speed = random(-5, 5);
  b.speed2 = random(-5, 5);
  b.f2 = 180;

  c = new Cube();
  c.X = 700;
  c.Y = 700;
  c.r = 80;
  c.speed = random(-5, 5);
  c.speed2 = random(-5, 5);
  c.f3 = 180;
}

void draw()
{
  background(0);
  lights();
  inc += 0.01;


  a.rotation();
  a.mouses();
  a.check();

  b.rotation();
  b.check();
  b.mouses();

  c.rotation();  
  c.check();  
  c.mouses();
  
}

void mouseReleased()
{
  a.speed = random(-5, 5);
  a.speed2 = random(-5, 5);

  b.speed = random(-5, 5);
  b.speed2 = random(-5, 5);

  c.speed = random(-5, 5);
  c.speed2 = random(-5, 5);
}


void keyPressed()
{
  if (key == 'r')
  {
    a.X = width/2;
    a.Y = height/2;
    c.X = 700;
    c.Y = 700;
    b.X = 100;
    b.Y = 100;
  }
  if (key == ' ')
  {
    if (squares) 
    {
      circles = true;
      squares = false;
    }
    else if (circles) 
    {
      squares = true;
      circles = false;
    }
  }
}
class Cube
{
  float X, Y; //for position
  float r; //size
  float speed, speed2;
  int f, f2, f3; //fill color


  void rotation()
  {
    if (squares) {
      fill(f, f2, f3, 120);

      X += speed;
      Y += speed2;
      pushMatrix();
      translate(X, Y);
      rotateX(inc);
      rotateY(inc);
      box(r);
      popMatrix();
    }

    if (circles)
    {
      fill(f, f2, f3, 120);
      X += speed;
      Y += speed2;
      pushMatrix();
      translate(X, Y);
      rotateX(inc);
      rotateY(inc);
      sphere(r);
      sphereDetail(10, 5);
      popMatrix();
    }
  }

  void check()
  {
    if (X > width - r) 
    {
      speed *= -1;
    }
    if (X < r) 
    {

      speed *= -1;
    }
    if (Y > height - r) 
    {

      speed2 *= -1;
    }
    if (Y < r) 
    {

      speed2 *= -1;
    }
  }

  void mouses()
  {
    if (mousePressed)
    {
      if ((mouseX > X - r) && (mouseX < X + r) && (mouseY > Y - r) && (mouseY < Y + r))
      {
        X = mouseX;
        Y = mouseY;
      }
    }
  }
}


