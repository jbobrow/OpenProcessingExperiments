
int a = 1;
int b = 1;
void setup()
{
  size(500,500);
  noStroke();
  textSize(100);
  frameRate(1);
}
void draw()
{
  background(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)));
  while (a < b)
  {
    fill(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)),int(random(100, 200)));
    ellipse(random(500),random(500),random(10,50),random(10,50));
    a++;
  }
  b*=2;
  
  fill(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)));
  text(b/4,100,100);
  if(b/4 == 1024)
  {
    a = 1;
    b = 2;
  }
}
