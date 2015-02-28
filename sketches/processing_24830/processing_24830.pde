
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

int w = 0;

void back2()
{
  loop();
  smooth();
  strokeWeight(1);
  for(float q=-1;
          q<height; 
          q = q + 1)
  {
    ellipse(w, q, 0.1, 0.1);
    stroke(color(255,0,0),random(0,55));
  }
  w=w+1;
}

int f = 0;
float p = 0;

void line1()
{  
  if(f < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(0.5,1));
    ellipse(random(0 + p,1 + p), f, random(0.5,3), random(0.5,2));
    noFill();
  }
  p = p + 0.5;
  f = f + 1;
}

int i = 0;
float o = 0;

void line2()
{
  if(i < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(0 + o,1 + o), i, random(0.5,2), random(0.5,2));
  }
  o = o + 2;
  i = i + 1;
}

int u = 0;
float y = 0;

void line3()
{
  if(u < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(0 + u,1 + u), y+50, random(0.5,2), random(0.5,2));
  }
  u = u + 2;
  y = y + 1;
}

int l = 0;
float k = 0;

void line4()
{
  if(l < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(0 + k,1 + k), l+100, random(0.5,2), random(0.5,2));
  }
  k = k + 2;
  l = l + 1;
}

int j = 0;
float h = 0;

void line5()
{
  if(j < width)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(-40+1 + h,height/2 + h), 250, random(0.5,2), random(0.5,2));
  }
  h = h + 1;
  j = j + 1;
}

int m =0;
float n = 0;

void line6()
{
  if(m < height)
  {
    fill(color(0,0,204),20);
    stroke(color(0,0,204),70);
    strokeWeight(random(0.5,1));
    ellipse(m, random(height - 0.5 - n,height + 0.5 - n), random(0.5,3), random(0.5,2));
    noFill();
  }
  n = n + 2;
  m = m + 1;
}

int b = 0;
float ve = 0;

void line7()
{
  if(b < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(0 + ve,1 + ve), b + 375, random(0.5,2), random(0.5,2));
  }
  ve = ve + 2;
  b = b + 1;
}

int qw = 0;
float we = 0;

void line8()
{
  if(qw < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(0 + we,1 + we), qw + 325, random(0.5,2), random(0.5,2));
  }
  we = we + 2;
  qw = qw + 1;
}

int er = 0;
float rt = 0;

void line9()
{
  if(er < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(0 + rt,1 + rt), er + 275, random(0.5,2), random(0.5,2));
  }
  rt = rt + 2;
  er = er + 1;
}

int ty = 0;
float yu = 0;

void line10()
{
  if(ty < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(250 - yu,50 - yu), ty + 275, random(0.5,2), random(0.5,2));
  }
  yu = yu + 2;
  ty = ty + 1;
}

int ui = 0;
float io = 0;

void line11()
{
  if(ui < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(250 - io,100 - io), ui + 325, random(0.5,2), random(0.5,2));
  }
  io = io + 2;
  ui = ui + 1;
}

int op = 0;
float pa = 0;

void line12()
{
  if(op < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(250 - pa,100 - pa), op + 375, random(0.5,2), random(0.5,2));
  }
  pa = pa + 2;
  op = op + 1;
}

int as = 0;
float sd = 0;

void line13()
{
  if(as < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(250 - sd,100 - sd), as, random(0.5,2), random(0.5,2));
  }
  sd = sd + 2;
  as = as + 1;
}

int df = 0;
float fg = 0;

void line14()
{
  if(df < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(250 - fg,100 - fg), df + 50, random(0.5,2), random(0.5,2));
  }
  fg = fg + 2;
  df = df + 1;
}

int gh = 0;
float hj = 0;

void line15()
{
  if(gh < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(250 - hj,100 - hj), gh + 100, random(0.5,2), random(0.5,2));
  }
  hj = hj + 2;
  gh = gh + 1;
}

int jk = width/2;
float kl = 0;

void line16()
{
  if(jk < height)
  {
    stroke(color(0,0,204),100);
    strokeWeight(random(1,2));
    ellipse(random(width/2-0.5 - kl,width/2+0.5 - kl), jk, random(0.5,2), random(0.5,2));
  }
  jk = jk + 1;
}
int v = 0;
int g = 0;
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
  line8();
  line9();
  line10();
  line11();
  line12();
  line13();
  line14();
  line15();
  line16();
  control = control + 1;
  }
  if(control==500)
  {
    println("finished");
    exit();
  }
}

