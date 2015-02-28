
float x1 = mouseX;
float y1 = mouseY;
int x2 = 250;
int y2 = 250;
float radius = 25;
float afstand =50;

void setup() 
{
size (500,500);
background (255);
}
 

void draw() 
{
  x1 = mouseX;
  y1 = mouseY;
afstand = sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));


if (afstand <= radius)
{
 background (255,7,7); 
  
}
 else {
  background (255);
 } 
 ellipse(250,250,50,50);
}
