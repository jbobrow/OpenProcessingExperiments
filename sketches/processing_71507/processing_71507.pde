
//Jun Min Z, User Input, CP1, Mods 16-17

float r=256;
float g=256;
float b=256;
float t=256;
void setup()
{
  size(1000,1000);
  fill(0);
  rect(0,0,1000,1000);
}

void mouseDragged()
{
  if(key=='a')
  {
    stroke(r,g,b,t);
    line(mouseX,mouseY,pmouseX,pmouseY);
    line(1000-mouseX,mouseY,pmouseX,pmouseY);
    r=random(256);
    g=random(256);
    b=random(256);
    t=random(256);
  }
  if(key=='b')
  {
    stroke(r,g,b,t);
    line(mouseX,mouseY,pmouseX,pmouseY);
    line(mouseX,1000-mouseY,pmouseX,pmouseY);
    if(key=='a')
    r=256;
    g=256;
    b=256;
    t=random(256);
  }
  
}
void keyPressed()
{
  if(key=='c')
  {
    background(0);
  }
}
