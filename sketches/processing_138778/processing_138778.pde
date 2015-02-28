
float theta=0;
boolean col=true;

void setup()
{
  size(800, 600);
  background(0);
  strokeWeight(0.3);
   stroke(255);
   
}

void mouseReleased()
{
   col=!col;
   if (col == true)
   {  
     stroke(255);
   }
   else
   {
     stroke(random(128),random(255),random(255));
   }
}
   
void draw()
{
  fill(0, 10);
  rect(0, 0, 800, 600);
  
 theta+=0.01;
  if (keyPressed)
  {
    if (key == 's')
    {
      theta+=0.01;
    }
    if (key == 'S')
    {
      theta+=0.1;
    }
  }
  noFill();
  float x=theta;

  for (int i=0; i <=80;i++)
  {
    float y=sin(x)*height/2;
    ellipse(i*10, y+height/2, noise(x)*180, noise(x)*180);
    x+=2;
  }
}





