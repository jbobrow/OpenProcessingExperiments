
//Random Numbered Shapes

float r;
float g;
float b;
float x;
float y;
int num = 1;
void setup()
{
  size(600, 600);
  background(0);
  smooth();
  frameRate(10);
  textAlign(CENTER, CENTER);
  strokeWeight(2);
  rectMode(CENTER);
}
void draw()
{
  randomize();
  stroke(r, g, b);
  fill(random(0, 16));
  drawShape();
  fill(128+(r/2), 128+(g/2), 128+(b/2));
  textSize(random(9,13));
  text(num, x, y);
  num = num + 1;
  if (num > 10000)
  {
    num = 1;
  }
}
void randomize()
{
  r = random(0, 256);
  g = random(0, 256);
  b = random(0, 256);
  x = random(0, width);
  y = random(0, height);
}
void drawShape()
{
  int type = int(random(0, 13));
  if (type <= 3)
  {
    ellipse(x, y, random(40, 60), random(40, 60));
  }
  else if (type == 4)
  {
    float s = random(40, 60);
    ellipse(x, y, s, s);
  }
  else if (type <= 6)
  {
    rect(x, y, random(40, 60), random(40, 60));
  }
  else if (type == 7)
  {
    float s = random(40, 60);
    rect(x, y, s, s);
  }
  else if (type == 8)
  {
    float s = random(40, 60);
    triangle(x, y-(s*3/4), x+(s/2), y+(s/4), x-(s/2), y+(s/4));
  }
  else if (type == 9)
  {
    float s = random(40, 60);
    triangle(x, y+(s*3/4), x+(s/2), y-(s/4), x-(s/2), y-(s/4));
  }
  else if (type == 10)
  {
    float s = random(40, 60);
    quad(x, y-(s/2), x+(s/2), y, x, y+(s/2), x-(s/2), y);
  }
  else
  {
    float s = random(40, 60);
    int n = 17-int(sqrt(random(16, 169)));
    float p = random(0, 2*PI);
    beginShape();
    int i = 0;
    while (i < n)
    {
      vertex(x+(s*cos(p)/2), y+(s*sin(p)/2));
      i = i + 1;
      p = p + (2*PI/n);
    }
    endShape(CLOSE);
  }
}
