
float spin;
void setup()
{
  size(500,500);
  smooth();
  noStroke();
  frameRate(30);
}

void draw()
{
background(0);
for(int x=50;x<=450;x+=40)
{
  for(int y=50;y<=450;y+=40)
  {
    fill(255);
    spin+=.002;
    arc(x,y,30,30,spin+0+map(x,50,450,0,PI)+map(y,50,450,0,PI),spin+PI+map(y,50,450,0,PI)+map(x,50,450,0,PI));
  }
}
}

