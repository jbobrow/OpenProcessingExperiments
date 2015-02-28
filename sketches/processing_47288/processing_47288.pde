
float a1, a2, a3;
float n;
float z;
color c;

void setup()
{
  size(800, 800);
  colorMode(RGB, 255);
  background(255);
  smooth();
  
  a1 = a2 = a3 = 0;
  n = random(255);
  z = 0;
  c = color(120, 180, 160);
}

void draw()
{
  fill(255, 12);
  stroke(255, 12);
  rect(0, 0, width, height);
  
  c = color(cos(z)*128+128, cos(z)*192, cos(z)*64+64);
  stroke(c, 255);
  translate(width/2, height/2);
  pushMatrix();
  rotate(a1);
  ellipse(0, 0, cos(z)*512, 512);
  popMatrix();
  pushMatrix();
  rotate(a3);
  c = color(cos(z)*128+128, cos(z)*192, cos(z)*64+64);
  stroke(c, 255);
  ellipse(0, 0, sin(z)*512, 512);
  popMatrix();
  rotate(-a2);
  c = color(cos(z)*128+128, cos(z)*192, cos(z)*64+64);
  stroke(c, 255);
  ellipse(0, 0, tan(z)*512, 512);
  
  a1 = (a1+0.01)%TWO_PI;
  a2 = (a2+0.02)%TWO_PI;
  a3 = (a3+0.04)%TWO_PI;
  z = (z+0.003)%TWO_PI;
  n = n+0.01;
}


