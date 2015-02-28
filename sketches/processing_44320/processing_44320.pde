
PImage calvin;

void setup()
{
  size(640,480);
  calvin = loadImage("calvinandhobbes.jpg");
  smooth();
  strokeWeight(2);  
}
void draw()
{
  image(calvin, 0,0);
  
  color tmp = get(mouseX,mouseY);
  fill(tmp, 200);
  ellipse(mouseX,mouseY, 70,70);
}

