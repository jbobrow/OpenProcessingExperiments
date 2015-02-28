
int[] px = new int[20];
int[] py = new int[20];

void setup()
{
  size(400,400);
  noStroke();
}

void draw()
{
  background(0);
  
  px[0] = mouseX;
  py[0] = mouseY;


  for(int i=0; i<19; i++)
  {
    fill(0,(19-i)*10,10*i,100);
    ellipse(px[i],py[i],(19-i)*3,(19-i)*3);
  }

  for(int i=0; i<19; i++)
  {
    px[(19-i)]=px[(18-i)];
    py[(19-i)]=py[(18-i)];
  }

}

