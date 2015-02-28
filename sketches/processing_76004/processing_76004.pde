
//Polly Lesaguis, CP1, mods 4-5, doublingshapes

int y = 1;
void setup()
{
  size(500, 500, P3D);
  frameRate(1);
  
}
void draw()
{ 
  background(random(125));
  int x = 1;
  while (x<=y)
  {
    int xOffset = int(random(500));
    int yOffset = int(random(4));
    translate(xOffset, yOffset);
    fill(random(124),random(345),454);
    box(10);
    translate(-xOffset,yOffset);
   x=x+1;
    
    
  }
   y=y*2;
}
