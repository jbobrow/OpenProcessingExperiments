
// Will Slotterback CP1 16/17 Doubling Shapes  
int numShapes=0;
float limit = 1;
void setup()
{
  size(500, 500);
  background(0);
  frameRate(1);
  textSize(30);
}
void draw()
{
  if (numShapes>=limit)
  {
    background(0);
    limit=limit*2;
    numShapes=0;
  }
  while (numShapes<limit)
  {
    int x = int(random(-21, 481));
    int y = int(random(-21, 481));
    numShapes++;
    fill(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)), 150);
    rect(x, y, 30, 30, 7);
    fill(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)), 185);
    ellipse(x+15, y+15, 15, 15);
    textSize(32);
    if (numShapes==8192*2)
    {
      numShapes=0;
      limit=.5;
    }
  }
  if (limit==1)
  {
    fill(255);
    text("1", 40, 40);
  }
  if (limit==2)
  {
    fill(255);
    text("2", 40, 40);
  }
  if (limit==4)
  {
    fill(255);
    text("4", 40, 40);
  }
  if (limit==8)
  {
    fill(255);
    text("8", 40, 40);
  }  
  if (limit==16)
  {
    fill(255);
    text("16", 40, 40);
  }  
  if (limit==32)
  {
    fill(255);
    text("32", 40, 40);
  }  
  if (limit==64)
  {
    fill(255);
    text("64", 40, 40);
  }  
  if (limit==128)
  {
    fill(255);
    text("128", 40, 40);
  }  
  if (limit==256)
  {
    fill(255);
    text("256", 40, 40);
  }  
  if (limit==512)
  {
    fill(255);
    text("512", 40, 40);
  }  
  if (limit==1024)
  {
    fill(255);
    text("1024", 40, 40);
  }  
  if (limit==2048)
  {
    fill(255);
    text("2048", 40, 40);
  }  
  if (limit==4096)
  {
    fill(255);
    text("4096", 40, 40);
  }
  if (limit==8192)
  {
    fill(255);
    text("8192", 40, 40);
  }
}
