
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

  translate(mouseX, mouseY);
  rotate(radians(frameCount));
    
  strokeWeight(1);
  stroke(0, 0, 0, 255);
  fill(255, 255, 255, 255);
  rect(0, 0, 30, 30);

}

