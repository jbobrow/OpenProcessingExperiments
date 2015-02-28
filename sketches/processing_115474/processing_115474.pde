
float nextX;
float nextY;
float prevX;
float prevY;
float thirdX;
color currentColor;
PImage wheel;
float s=1;
float r=0;
void setup()
{
  size(500,500);
  wheel=requestImage("wheel.jpg");
}
void draw()
{
  if(wheel.width>0)
  {
    image(wheel,0,0,200,200);
  }
  if (mousePressed==true)
  {
    if(mouseButton==LEFT)
    {
      fill(red(currentColor), green(currentColor), blue(currentColor));
      stroke(red(currentColor), green(currentColor), blue(currentColor));
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(r);
      scale(s);
      triangle(0,0,0+10,0-10,0+20,0);
      //line(0,0,mouseX+10,mouseY-10);
      popMatrix();
    
    }
    if(mouseButton==RIGHT)
    {
      currentColor=get(mouseX,mouseY);
    }
  }   
}
void keyPressed()
{
  if (keyCode==UP)
  {
    s+=1;
  }
  if(keyCode==DOWN)
  {
    s--;
  }
  if(keyCode==RIGHT)
  {
    r+=0.5;
  }
  if(keyCode==LEFT)
  {
    r-=0.5;
  }
  if(key=='c')
  {
    fill(255);
    rect(0,0,600,600);
    fill(currentColor);
  }
}


