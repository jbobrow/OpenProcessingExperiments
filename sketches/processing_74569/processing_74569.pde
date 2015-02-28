
//Polly Lesaguis, CP1, mods 6-7, hundredboxes

void setup()
{
  size(500, 500, P3D);
  frameRate(6);
}
void draw()
{ 
  background(0);
  int x= 1;
  while (x < 101)
  {
  
    x++;
    
    int xOffset = int(random(0,500));
    int yOffset = int(random(0,6));
    translate(xOffset, yOffset);
    box(50);
    fill(random(240),random(177),random(177));
    translate(-xOffset,yOffset);
   
  }
}
