
void setup()
  {
 size(500, 500);
  background(0);
  smooth();
  }
 
 
 
void draw()
  {
  for (int i=10; i < random(10, 70); i = i+500)
  {
  stroke(random(20), random(20),  random(1, 255));
  strokeWeight(random(80, 80));
  point(mouseX+random(100), mouseY-random(100));
  filter(BLUR, 0.2);
  }
  }

