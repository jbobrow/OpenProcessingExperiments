
float side, theta;
void setup()
{
  size(800, 600);
  background(100);
  smooth();
}

void draw()
{
  background(50);
  noFill();
  stroke(255);
  side = 80;
  theta = radians((mouseX / (float) width) * 90f);
  translate(3*width/5, height-(2*side));
  rect(0,0,side,side);
  iterate(side);
}

void iterate(float s)
{
  float s1 = (s*sqrt(3))/2;
  float s2 = s/2;

  if (s1 > 1)
  {
    //draw left square, call iterate
    pushMatrix();
    rotate(-theta);
    rect(0, 0, s1, -s1);
    translate(0, -s1);
    iterate(s1);
    popMatrix();
    //draw right square, call iterate
    pushMatrix();
    translate(s,0);
    rotate(-theta);
    rect(0,0,s2,-s2);
    translate(s2,-s2);
    rotate(3*theta);
    iterate(s2);
    popMatrix();
  }
}


