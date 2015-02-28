
//Nathan Trevino  
//Homework 10
//Processing Wednesday, October 6, 2011
//Copyright October 6, 2011
//Carnegie Mellon University. Pittsburgh PA
//there is just a practice sphere in here too.


int Wd = 600;
int Ht = 600;
int trans1;
int trans2;
int boxsize;


void setup()
{
  size(600, 600, P3D);
  background(255);
  trans1 = Wd/6;
  trans2 = Wd/12;
}

void draw()

{
  background(255);
  finished();
  spheres();
}


void finished()
{

  pushMatrix();
  translate(trans1, 0);
  for (int boxX = trans1; boxX<= 400; boxX +=trans1)
  {
    Boxes1 (boxX, trans1);
  }
  popMatrix();
  //-------
  Boxes2();
  //-------
  Boxes3( 0, 0);
} 

void Boxes1(int x, int y)
{
  //pushMatrix();
  fill(0);
  stroke(155);
  translate( 0, trans1);
  box(Wd/6);
  //popMatrix();
}

void Boxes2()
{
  stroke(0);
  fill(150);
  translate(trans1, trans1, trans1);
  box(Wd/6);
  translate(trans2, trans2, 0);
  box(Wd/6);
  translate(trans2, trans2, 0);
  box(Wd/6);
  translate(trans2, trans2, 0);
  box(Wd/6);
  translate(trans2, trans2, 0);
  box(Wd/6);
  translate(trans2, trans2, 0);
  box(Wd/6);
  translate(trans2, trans2, 0);
  box(Wd/6);
}

void Boxes3(int x, int y)
{

  fill(0);
  stroke(155);
  translate( 0, trans1, -(trans1*2));
  box(Wd/6);
  translate(0, -trans1, 0);
  box(Wd/6);
  translate(0, -trans1, 0);
  box(Wd/6);
  translate(0, -trans1, 0);
  box(Wd/6);
  translate(0, -trans1, 0);
  box(Wd/6);
}

void spheres()
{
  pushMatrix();
  translate(8*sin(frameCount/5), 25*cos(frameCount/20), 100);
  noStroke();
  fill(255,random(20, 230),0);
  sphere (30);
  popMatrix();
}


