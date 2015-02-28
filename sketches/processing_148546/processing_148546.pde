
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
  stroke(0, 0, 0, 255);
  strokeWeight(1);
  fill(255, 255, 255, 255);
  line(0, 0, mouseX, mouseY);
  ellipse(mouseX, mouseY, 50, 50);  
}
