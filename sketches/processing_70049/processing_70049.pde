
//Eric K, CP1 mods 4-5, Animation
//url: http://ericsprogrammingsite.com/Animation.html

int r = 0;
int n = 0;
int c = 0;
int i = 1;
void setup()
{
  size(600,600);
  noFill();
  background(0);
  colorMode(HSB,360);
}
void draw()
{
  drawEllipse();
  moveEllipse();
}
void drawEllipse()
{
  stroke(c,360,360);
  translate(width/2,height/2);
  rotate(r*PI/90);
  ellipse(n,0,60+(10*i)+n,60-(10*i)+n);
}
void moveEllipse()
{
  n = n + 1;
  c = c + 3;
  if(i%2 == 0)
  {
    r = r + 5;
  }
  if(i%2 == 1)
  {
    r = r - 5;
  }
  if(c > 360)
  {
    c = 0;
  }
  if(n > 1200)
  {
    r = 0;
    n = 0;
    c = 0;
    i = i + 1;
    background(0);
  }
}
