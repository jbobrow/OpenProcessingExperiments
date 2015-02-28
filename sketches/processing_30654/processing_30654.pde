
void setup()
  {
 size(500, 400);
  background(100);
  smooth();
  }
 
 
void draw()
  {
  for (int i=1; i < random(10000, 9000); i = i+15000)
  {
  stroke(random(255), random(0), 0, random(10, 255));
  strokeWeight(random(10, 40));
  point(mouseX+random(20), mouseY-random(20));
  filter(BLUR, 1.0);
  }
  }
  
