
//random walk project project
//Iam B,Computer Programming 1

int x=0;
int y=0;
int r=0;
int g=0;
int b=0;
int c=0;
int d=0;
int e=0;
void setup()
{
  size(300, 300);
  background(170);
  smooth();
  noStroke();
}

void draw()
{


  if (mousePressed)
  {
    background(170);
    fill(c,d,255);
    ellipse(150+x, 150+y, 200, 250);
    fill(b,r,g);
    ellipse(150+x, 200+y, 150, 150);
    fill(g,b,r);
    ellipse(135+x, 80+y, 40, 80);
    ellipse(165+x, 80+y, 40, 80);
    fill(255, 200, 0);
    triangle(135+x, 105+y, 165+x, 105+y, 150+x, 140+y);
    ellipse(120+x, 270+y, 70, 40);
    ellipse(180+x, 270+y, 70, 40);
    fill(r, g, b);
    ellipse(142+x, 80+y, 20, 30);
    ellipse(158+x, 80+y, 20, 30);
    fill(c,d,255);
    triangle(55+x, 120+y, 35+x, 170+y, 55+x, 160+y);
    triangle(245+x, 120+y, 265+x, 170+y, 245+x, 160+y);
    x=x+int(random(-2, 2));
    y=y+int(random(-2, 2));
    r=int(random(0,256));
    g=int(random(0,256));
    b=int(random(0,256));
    c=int(random(0,256));
    d=int(random(0,256));
    e=int(random(0,256));
  }
  else
  {
    background(170);
    fill(0);
    ellipse(150, 150, 200, 250);
    fill(255);
    ellipse(150, 200, 150, 150);
    ellipse(135, 80, 40, 80);
    ellipse(165, 80, 40, 80);
    fill(255, 200, 0);
    triangle(135, 105, 165, 105, 150, 140);
    ellipse(120, 270, 70, 40);
    ellipse(180, 270, 70, 40);
    fill(0);
    ellipse(142, 80, 20, 30);
    ellipse(158, 80, 20, 30);
    fill(0);
    triangle(55, 120, 35, 170, 55, 160);
    triangle(245, 120, 265, 170, 245, 160);
  }
}
