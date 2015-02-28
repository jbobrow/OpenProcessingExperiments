

// First and only once:
void setup()
{
  size(600, 600);
  background(255, 255, 255);
  frameRate(30);
}
 
// Then, repeat:
void draw()
{ 
  strokeWeight(5);
  stroke(0, 0, 0, 255);

  fill(255, 255, 255, 255);
  rectMode(CENTER);
  rect(mouseX, mouseY, 100, 100);
  ellipse(mouseX, mouseY, 100, 100); 

}
