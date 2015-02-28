
//Jarvis Law,100 Random Shapes,CP1 mods 16-17
void setup()
{
  background(0);
  size(500,500);
  frameRate(1);
}
void draw()
{
  int r=int(random(1,256));
  int g=int(random(1,256));
  int b=int(random(1,256));
  strokeWeight(2);
  stroke(255-r,255-g,255-b);
  background(0);
  int a=2;
  while (a<=101)
  {
    fill(r,g,b,50);
    ellipse(int(random(500)),int(random(500)),80,80);
    fill(b,g,r,50);
    rect(int(random(500)),int(random(500)),70,70);
    a++;
  }
}
