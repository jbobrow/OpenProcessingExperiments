
int [] posX = {32,width/2, 60, 130, 160};
int i;
void setup()
{
  size(200,200);
  background(255);
  fill(0);
  rect(0,0,20,200);
  rect(180,0,20,200);
  rect(0,180,200,20);
  fill(255,0,255);
  if(mouseX <= 20 || mouseX >= 180 || mouseY >= 180)
   {
    for( int i = 0; i < posX.length; i++)
    {
      posX[i] =i *6;
    }
    }
}
void draw()
{

 ellipse(posX[0], height/2, 20,15);
 ellipse(posX[1], height/2, 20,15);
 ellipse(posX[2], height/2, 20,15);
 ellipse(posX[3], height/2, 20,15);
 ellipse(posX[4], height/2, 20,15);

   
}
