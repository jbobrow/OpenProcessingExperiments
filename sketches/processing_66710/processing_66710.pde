
int clicks = 0;
int[] myXs = new int [200];
int[] myYs = new int [200];
int pre = 0;

void setup()
{
  size(500,500);
  background(255);
}
void draw()
{
  
  beginShape(LINES);
  vertex(mouseX,mouseY);
  for(int i = 0 ; i < clicks ; i++)
  {
    pre = clicks - i;
    vertex(myXs[pre], myYs[pre]);
  }
  myXs[clicks] = mouseX;
  myYs[clicks] = mouseY;
}
void mouseClicked()
{
  fill(0);
  clicks++;
  ellipse(mouseX,mouseY,10,10);
  for(int j= 0; j< clicks; j++)
  {
  println("X = " + myXs[j]);
  println("Y = " + myYs[j]);
  }
   println("clicks = " + clicks);
}

