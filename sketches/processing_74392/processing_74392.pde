
/** Wires - jnyhoff */
int diameter = 10;

void setup()
{
  size(600, 600);
  background(0, 0, 0);
  smooth();
  frameRate(5);
  
}

void draw()
{
  background(0, 0, 0);
  stroke(255, 255, 255);
  for (int i=0; i <= width; i=i+diameter)
  {
    line(i, 0, i, height);
    line(0, i, width, i);
    fill(random(255),random(255),random(255));
    ellipse(random(width), i, diameter, diameter);
    ellipse(i, random(height), diameter, diameter);
    
  }
  
  
}


