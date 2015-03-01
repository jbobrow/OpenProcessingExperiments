
void setup()
{
  size(360,500);
}

void draw()
{
}

void keyPressed()
{
  fill(random(255));
  rect(0,0, 360,100);
  int a = int(random(255));
  int b = int(random(255));
  int c = int(random(255));
  fill(a, b,c);
  rect(0,100, 180,250);
  fill(255 - a, 255 - b, 255 - c);
  rect(180,100, 360,250);
  a = int(random(255));
  b = int(random(255));
  c = int(random(255));
  fill(a, b,c);
  rect(0,250, 180,400);
  fill(255 - a, 255 - b, 255 - c);
  rect(180,250, 360,400);
  
  fill(random(255));
  rect(0,400, 360,500);
  save("Test.jpg");
}
