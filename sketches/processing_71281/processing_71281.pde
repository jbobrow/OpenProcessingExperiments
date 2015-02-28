
//Benson L, User Input, CP1 mods 14-15
int x = 30;
int y = 85;
int z = 152;
void setup()
{
  size(400,400);
}
void draw()
{ 
  stroke(255);
}
void keyPressed()
{
  if(key == 't')
  {   
    fill(255,0,0);
    ellipse(mouseX,mouseY,pmouseY,pmouseX);
    ellipse(400-mouseX,mouseY,pmouseX,pmouseY);
  }
  if(key == 'r')
  {
    background(200);
    x = 15;
    y = 24;
    z = 78;
  }
}
void mouseDragged()
{
  if(mouseButton == LEFT)
  {
    fill(x,y,z);
    rect(mouseX,mouseY,60,90);
    x = x + int(random(-6,6));
    y = y + int(random(-6,6));
    z = z + int(random(-5,5));
  }
  if(mouseButton == RIGHT)
  {
    stroke(0);
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}
