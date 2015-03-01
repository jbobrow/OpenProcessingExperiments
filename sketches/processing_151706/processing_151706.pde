

void setup ()
{
  size (600, 200);
  smooth();
}

void draw ()
{
  background (#57385c); 
  
  float distance = dist (mouseX, mouseY, width/2, height/2);
  
  stroke (#A75265);
  strokeWeight (distance / 4);
  line (mouseX, mouseY, width/2, height/2);
  
  noStroke();
  fill (#ffedbc);
  ellipse (width/2, height/2, 10, 10);
}

