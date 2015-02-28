
void setup()
{
  size(800,600);
  frameRate(1);
}
void draw()
{
  strokeWeight(5);
  smooth();
  background(137,130,134);
  int x = 1;
  while(x<=51)
  {
    fill(0);
    stroke(255,0,0);
    rect(int(random(800)), int(random(600)),50,50);
    x++;
  }
  int y = 1;
  while(y<=51)
  {
    fill(255,0,0);
    stroke(0);
    rect(int(random(800)), int(random(600)),50,50);
    y++;
  }
}
