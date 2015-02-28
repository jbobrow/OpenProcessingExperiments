
void setup()
{
  size(500, 1000);
}

int x = 250;
int y = 0;
int x2 = 250;
int y2 = 2;
int x3 = 250;
int y3 = 2;

void draw()
{
  background(#333333);
  smooth();
  noStroke();
  //Wing colors
  float shimmer1 = random(001, 666);
  float shimmer2 = random(666, 999);
  float shimmer3 = random(001, 555);
  float transp = random(90, 100);
  fill(shimmer1, shimmer2, shimmer3, transp);
  //Animate math
  float a = random(1, 200); 
  y = y + 2;
  y2 = y2 + 4;
  y3 = y3 + 6;
  if (y>1000) {
    y = 0;
  }
  if (y2>1000)
  {
    y2 = -250;
  }
  if (y3>1000)
  {
    y3 = -500;
  }
  //1st Bird
  triangle(0, a+y, x, y, x/2, y-100);
  triangle(x*1.5, y-100, x, y, 500, a+y);
  //2nd Bird
  triangle(0, a+250+y2, x2, y2+250, x2/2, 250+y2-100);
  triangle(x2*1.5, 250+y2-100, x2, y2+250, 500, a+250+y2);
  //3rd Bird
  triangle(0, a+500+y3, x3, y3+500, x3/2, 500+y3-100);
  triangle(x3*1.5, 500+y3-100, x3, y3+500, 500, a+500+y3);
}


