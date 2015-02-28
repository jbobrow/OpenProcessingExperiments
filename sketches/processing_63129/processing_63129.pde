

//variable "scope"

float xpos;
float ypos; 

void setup()
{
  size(500,500);
  smooth();
  

}


void draw()
{
  background(255);
  
  xpos += 1.5;
  ypos += 2.5;

 ellipse(xpos, ypos, 10, 10);
 
}

