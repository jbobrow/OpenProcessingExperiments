
int x,y;
int shapeSize=20;

void setup()
{
 size(400,200);
}

void draw()
{
 if (mouseX<width/2 && mouseY<height/2)
  fill(200,0,0);
 else if (mouseX>width/2 && mouseY<height/2)
  fill(0,0,200);
 else if (mouseX<width/2 && mouseY>height/2)
  fill(0,200,0);
 else
  fill(200,200,0);
 
  for (int i=0;i<20;i++)
 {
  for (int j=0;j<10;j++)
  {
   x=(i*shapeSize)+shapeSize/2;
   y=(j*shapeSize)+shapeSize/2;
   ellipse(x,y,20,20);
  }
 }
}
