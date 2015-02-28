
int op = 70;
float x, y, r; // Normal settings:
float r_min = 45; // 50
float r_max = 80; // 85
boolean s = false;

void setup()
{
  size(460, 460); // 600x600
  background(0);
  smooth();
  noStroke();
}

void draw()
{
  s = false;
  r = random(r_min, r_max);
  if(mousePressed)
  {
    x = mouseX;
    y = mouseY;
    fill(100, 0, 0, op);
    s = true;
  }
  else
  {
    x = random(0, width);
    y = random(0, height);
    fill(0, 0, 160, op);
  }
    if(random(0, 1.1) > 1 && s == false)
  {
    r = random(80, 150);
    fill(0, 150, 0, op);
  }
  ellipse(x, y, r, r);
}


