
void setup(){
size(400,300);
smooth();
}

void draw()
{
  background(255);
  for (int k=0;k<100;k++)
  {    
   line (frameCount*sin(k),0,frameCount*cos(k),height); 
  }
}

