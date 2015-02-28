
import processing.pdf.*;

void setup()
{
  size(250,500);
  noStroke();
  smooth();
  background(255);
}

int x = -15;

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
    ellipse(x, y, 0.1, 0.1);
    stroke(color(255,255,102),random(0,25));
  }
  x=x+1;
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

int q = 0;
float w = 0;

void line1()
{  
  if(q < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(0.5,1));
    ellipse(random(0 + w,1 + w), q, random(0.5,3), random(0.5,2));
    noFill();
  }
  w = w + 0.5;
  q = q + 1;
}

int e =0;
float r = 0;

void line2()
{
  if(e < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(1,1.5));
    ellipse(e, random(500 - 0.5 - r,500 + 0.5 - r), random(0.5,3), random(0.5,2));
    noFill();
  }
  r = r + 2;
  e = e + 1;
}

int t =0;
float y = 0;

void line3()
{
  if(t < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(1,1.5));
    ellipse(t, random(250 - 0.5 - y,250 - 0.5 - y), random(0.5,3), random(0.5,2));
    noFill();
  }
  y = y + 2;
  t = t + 1;
}

int u = 0;
float i = 0;

void line4()
{  
  if(u < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(0.5,1));
    ellipse(random(0 + i,1 + i), u-250, random(0.5,3), random(0.5,2));
    noFill();
  }
  i = i + 0.5;
  u = u + 1;
}

int o = 0;
float p = 0;

void line5()
{  
  if(o < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(0,0.7));
    ellipse(p, random(250,251), random(0.5,3), random(0.5,2));
    noFill();
  }
  p = p + 0.5;
  o = o + 1;
}

int a = 0;
float s = 0;

void line6()
{  
  if(a < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(0.5,1));
    ellipse(random(0 + s,1 + s), a + 250, random(0.5,3), random(0.5,2));
    noFill();
  }
  s = s + 0.5;
  a = a + 1;
}

int d =0;
float f = 0;

void line7()
{
  if(d < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(1,1.5));
    ellipse(d+width/2, random(500 - 0.5 - f,500 + 0.5 - f), random(0.5,3), random(0.5,2));
    noFill();
  }
  f = f + 2;
  d = d + 1;
}

int control = 0;

void draw()
{
  if (control<500)
  {
    back();
    back2();
    line1();
    line2();
    line3();
    line4();
    line5();
    line6();
    line7();
    control = control + 1;
  }
    if(control==500)
  {
  println("finished");
  //exit();
  }
}


