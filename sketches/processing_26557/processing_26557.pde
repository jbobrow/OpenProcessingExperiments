
float x, y;
float size = 40.0;

void setup() 
{
  size(200,200);
  noStroke();
  frameRate(50);
}

void draw() 
{
  background(255);
  
  x = x + 0.8;
  
  if (x > width * size) {
    x = -size;
  } 
  
  translate(x, height/2-size/2);
  fill(200, 50);
  rect(-size, -size/4, size, size);
  
  // Transforms accumulate.
  // Notice how this rect moves twice
  // as fast as the other, but it has
  // the same parameter for the x-axis value
  translate(x, 60);
  fill(200);
  rect(-size, -size, size, size);
}


