
float x=0;
float y=0;
int pixls;
int shade;

void setup()
{
  size(500,500);
  background(0);
  rectMode(CORNERS);
  noStroke();
  smooth();
  pixls=10;
}
void draw()
{
  pixls=int(map(mouseY,0,height,10,100));
  for(int k=0;k<pixls;k++)
  {
    x=0;
    for(int i=0; i<pixls; i++)
    {
      shade=int(random(255));
      if(shade<170)
      {
        fill(0);
      }
      else{
      fill(random(255),random(255),random(255));
      }
      rect(x,y,x+width/10,y+height/pixls);
      x=x+width/pixls;
    }
    y=y+height/pixls;
  }
  x=0;
  y=0;
}

    
    
    

