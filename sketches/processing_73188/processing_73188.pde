
//Hanson T., Rotating Cube and Box, Cp1 16/17
int x=0;
int y=150;
void setup()
{
  size(300,300,P3D);
}
void draw()
{
  background(197);
  translate(150,150,150);
  rotateX(x);
  rotateY(x);
  rotateZ(x);
  keyPressed(); 
  box(x);
  sphere(y);
  y=y+1;
  if(y>151)
  {
    y=-1;
  }
  if(y<1)
  {
   y=1;
  } 
  x=x+1;
  if(x>200)
  {
    x=-1;
  }
  if(x<0)
  {
    x=1;
  } 
}
void keyPressed()
{
  if(keyPressed == true && key == 'q')
  {
    stroke(0,255,0);
  }
  if(keyPressed == true && key == 'w')
  {
    stroke(255,0,0);
  }
  if(keyPressed == true && key == 'e')
  {
    stroke(0,0,255);
  }  
  if (keyPressed == true && key == 'r')
  {
   stroke(0,0,0);
  } 
  if(keyPressed == true && key == 't')
  {
    stroke(255,255,255);
  }  
}
