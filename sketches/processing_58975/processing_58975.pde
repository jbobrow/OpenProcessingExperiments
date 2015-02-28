
 
float x, y;
float size = 100.0;

void setup() 
{
  size(700,350);
  background(255, 244, 13);
  stroke(255); 
  fill(49, 232, 188);
}

void draw() 
{
  
  x = x + 2;
  
  if (x > width + size) {
    x = -size;
  } 
  
  translate(x, height/2-size/2);
  fill(49, 232, 188);
  rect(-size/2, -size/2, size, size);
}

