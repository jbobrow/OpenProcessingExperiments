
import processing.pdf.*;

void setup()
{
  size(250,500);
  noStroke();
  smooth();
  background(255);
}

int z = -15;

color redish = color(255,0,0);
color yellow = color(255,255,102);

void back()
{
  loop();
  smooth();
  strokeWeight(1);
  for(float y=-1;
          y<height; 
          y = y + 1)
  {
    ellipse(z, y, 0.1, 0.1);
    stroke(color(255,255,102),random(0,25));
  }
  z = z + 1;
}

int qw = 0;

void back2()
{
  loop();
  smooth();
  strokeWeight(1);
  for(float q=-1;
          q<height; 
          q = q + 1)
  {
    ellipse(qw, q, 0.1, 0.1);
    stroke(color(255,0,0),random(0,55));
  }
  qw=qw+1;
}

float q = 0;
float ac = 1;
float w = 0.4;
float vb = 1;

void circle1()
{  
  if(q < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(0.5,1));
    ellipse(random(ac,ac / w)+250/w, q-vb, random(0.5,ac), random(0.5,2));
    noFill();
  }
  ac = ac + 1;
  w = w + 0.1;
  q = q + 1;
  vb = vb =0.2;
}

float g = 0;
float yu = 1;
float t = 0.4;
float ty = 1;
float sa = 0;
void circle3()
{  
  if(g < height)
  {
    fill(color(0,0,204),sa);
    stroke(color(0,0,204),sa);
    strokeWeight(random(0.5,1));
    ellipse(random(yu, yu * w), g+yu+250, random(0.5,ac), random(0.5,2));
    noFill();
  }
  ac = ac + 0.5;
  sa = sa + 0.1;
  g = g + 1;
  yu = yu + 0.1;
}

float h = 0;
float tr = 10;
float bv = 1;

void circle4()
{  
  if(h < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(0,1));
    ellipse(random(bv, bv / w)+250/w, h-vb, random(0.5,tr), random(0.5,2));
    noFill();
  }
  tr = tr + 0.5;
  h = h + 1;
  bv = bv * 0.1;
}

float jh = width/4;
int hj = height;
float nb = 1;
void line1()
{

  stroke(0,0,204);
  strokeWeight(2 - nb);
  line(0,510,jh, hj);
  jh = jh + 62.5;
  nb = nb - 0.01;
  }

int control = 0;

void draw()
{
  if (control<750)
  {
    back();
    back2();
    circle1();
    circle3();
    circle3();
    circle3();
    circle4();
    line1();
    control = control + 1;
  }
    if(control==500)
  {
  println("finished");
  //exit();
  }
}


