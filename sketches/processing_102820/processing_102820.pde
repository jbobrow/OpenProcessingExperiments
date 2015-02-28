
void setup()
{
  size (500, 500);
  background(0);
}
void draw()
{}
void mouseDragged()
{
strokeWeight(4);
float red = map (mouseX, 0, width, 0, 255);
float blue = map(mouseY, 0, width, 0, 255);
float green = dist (mouseX, mouseY, width/2, height/2);
stroke(red, green, blue, 255);
fill(red);
ellipse(pmouseX, pmouseY, mouseX/2, mouseY/2);
}


