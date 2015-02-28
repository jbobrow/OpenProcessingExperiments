
int lastX,lastY;
float r;
float g;
float b;
float a;


void setup()

{
  size(300,169);
  background(255);
  smooth();

}

void draw() 
{
 
 r = random(255);
 g = random(255); 
 b = random(255);
 a = random(255);
 
  if(mousePressed == true)
  {
    stroke(r,g,b,a);
    line(lastX,lastY,mouseX,mouseY);
    }

  }

  void mousePressed ()

  {
    lastX = mouseX;
    lastY = mouseY; 

  }




