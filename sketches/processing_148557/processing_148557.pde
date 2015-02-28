
// First and only once:
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  frameRate(30);
}
 
// Then, repeat:
void draw()
{ 

  strokeWeight(1);
  stroke(0, 0, 0, 255);

  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);

}
