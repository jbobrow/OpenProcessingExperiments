
//Dominique A., Ticklish, CP1, Mod 16-17

int x = 150;
void setup()
{
  background(191,189,189);
  size(350,350);
  smooth();
  strokeWeight(5);
  stroke(random(255),random(255));
  frameRate(7);
}
void draw()
  {
  line(0,0,120,120);
  ellipse(175,175,x,x);
  fill(random(150));
  ellipse(x,x,10,10);
  x = int(random(0,200));
}
