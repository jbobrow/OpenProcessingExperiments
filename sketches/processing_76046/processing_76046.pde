
int x = 1;
int y = 1;
void setup()
{
  size(800,600);
  frameRate(1);
}
void draw()
{
  strokeWeight(5);
  smooth();
  background(0);
  int x = 1;
  while(x<=y)
  {
    fill(240,255,33);
    stroke(240,255,33);
    ellipse(int(random(800)), int(random(600)),20,20);
    x++;
  }
  y=y+y;

}
