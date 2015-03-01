

void setup ()
{
  size (600, 200);
  smooth();
}

void draw ()
{
  background (#57385c); 
  
  float distance = dist (mouseX, mouseY, width/2, height/2);
  float maxDistance = dist (0,0, width/2, height/2);
  
  float myStrokeWeight = map (distance, 0, maxDistance, 50, 1);
  
  stroke (#A75265);
  strokeWeight (myStrokeWeight);
  line (mouseX, mouseY, width/2, height/2);
  
  noStroke();
  fill (#ffedbc);
  ellipse (width/2, height/2, 10, 10);
}

