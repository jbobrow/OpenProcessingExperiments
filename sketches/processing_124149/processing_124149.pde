
void setup()
{
  size(600,600);
}

void draw()
{
ellipse(mouseX,mouseY,50,50);

if(key=='r')
{
  fill(random(255),random(255),random(255));
   }
   if(key=='b')
   {
fill(0,0,255);
   }
   
   image(loadImage("sls.jpg"),0,0);
   
}


void keyPressed()
{
  if(key == ' ')
  {
    background(255,255,255);
  }
  
}
void mouseDragged()
{
  ellipse(mouseX,mouseY,0,0);
}

