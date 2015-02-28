
// © Laura Tjho
// 60-257 Hw Assignment 9 

float [] a = {
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
};

float [] b = {
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
};

float [] c = {
  random(10,40),
  random(10,40),
  random(10,50),
  random(10,50),
  random(10,80),
  random(10,80),
  random(10,60),
  random(10,60),
  random(10,40),
  random(10,40),
};

color [] col = {
  color(255, random(249), 57),
  color(255, random(110), 57),
  color(57, random(255), 78),
  color(255, random(57), 206),
  color(255, random(249), 57),
  color(255, random(110), 57),
  color(57, random(255), 78),
  color(255, random(57), 206),
  color(255, random(249), 57),
  color(255, random(110), 57),
};

void setup()
{
  size(400,400);
  background(77,77,77);
  smooth();
}

void draw()
{
  for (int i = 0; i < a.length; i++)
  {
    fill(col [i]);
    rect(a[i], b[i], c[i], c[i]);
    
    noFill();
    stroke(col[i]);
    ellipse(a[i]+i, b[i], c[i], c[i]);
    ellipse(b[i], a[i], c[i], c[i]);
  }
}

