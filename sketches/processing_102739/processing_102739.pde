
void setup()
{
  size(940, 660);
  background(0,0,0);

}


void mouseDragged()
{

float red = map(mouseX, 0, width, 0, 255);
float blue = map(mouseY, 0, width, 0, 255);
float green = dist(mouseX,mouseY,width/2,height/2);
float a = pmouseX/2;
float b = pmouseY/6;

stroke(red,blue,green,155);
strokeWeight(1);
line(mouseX,mouseY,a,b);

}
