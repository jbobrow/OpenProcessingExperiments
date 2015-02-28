
// © Laura Tjho
// 60-257 Hw Assignment 10

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


float [] deltaA = {
  random(10,40),
  random(10,40),
  random(10,30),
  random(10,30),
  random(10,20),
  random(10,20),
  random(20,40),
  random(20,40),
  random(30,40),
  random(30,40)
};

float [] deltaB = {
  random(10,20),
  random(20,40),
  random(30,60),
  random(40,70),
  random(40,60),
  random(40,50),
  random(10,20),
  random(20,30),
  random(10,20),
  random(5,10)
};


void setup()
{
  size(400,400);
  background(77,77,77);
  smooth();
}

void draw()
{
  bounceObject();
  
  for (int i = 0; i < a.length; i++)
  {
    noFill();
    stroke(col[i]);
    rect(a[i], b[i], c[i], c[i]);
    
    
    noFill();
    stroke(col[i]);
    ellipse(a[i]+i, b[i], c[i], c[i]);
    ellipse(b[i], a[i], c[i], c[i]);
  }
}

void bounceObject()
{
 
  for (int x=0; x< a.length; x++)
  {
    a [x] = a[x] + deltaA[x];
    b [x] = b[x] + deltaB[x];
    
    if (a[x] > width || b[x] > height || a[x] < 0 || b[x] < 0)
    {
      deltaA[x] = -deltaA[x];
      deltaB[x] = -deltaB[x];
    }
  }
}

