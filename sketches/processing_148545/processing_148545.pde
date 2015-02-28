
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
  stroke(0, 0, 0);
  strokeWeight(1);
  fill(255, 255, 255);
  ellipse(mouseX, mouseY, 50, 50);  
}
