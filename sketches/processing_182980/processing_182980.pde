
float opa;
color col;

void setup()
{
  size(400, 400);
  background(#9D88DE);
  smooth();
}

void draw() 
{
 
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  col = color (int(random (255)), int(random (255)), int(random (255)));
   opa=mouseY*1;
}



void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  fill (col, opa);
  rect(x, y, speed, speed);
  ellipse(x,y,speed,speed);
  triangle(x,y,x,y,x,y);
  
}



