
// Jamie Scott z3352200

int prev_x;
int prev_y;

void setup()
{
  size(400, 400);
  noStroke();
  background(255);
  ellipseMode(CENTER); 
}

void draw()
{ 
  // Check if the mouse has moved
  if( mouseX != prev_x && mouseY != prev_y)
  {
    // Generate random circle size and colours
    float radius = random(20, 100);
    float fillColour_r = random(0, 255);
    float fillColour_g = random(0, 255);
    float fillColour_b = random(0, 255);
    
    // Draw the circles
    fill(fillColour_r, fillColour_g, fillColour_b);
    ellipse(mouseX, mouseY, radius, radius);
  }
  
  prev_x = mouseX;
  prev_y = mouseY;
}
