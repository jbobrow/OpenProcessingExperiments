
int [] posX = {80,120,width/2,80,100};

void setup()
{
  size(200,200);
  background(0);
}
 
 void draw()
{
  fill(255);
rect(20,0,160,180);

if (mouseX < 20||mouseX > 180||mouseY > 180)
{
 for(int i = 0; i < posX.length; i++)
{
 ellipse(posX[i], height/4, 30,30);
 ellipse(posX[i], height/4, 30,30);
 ellipse(posX[i], height/2,50,30);
 rect(posX[i], height/6*4, 20,30);
 rect(posX[i], height/6*4, 20,30);
}
 
}
}
