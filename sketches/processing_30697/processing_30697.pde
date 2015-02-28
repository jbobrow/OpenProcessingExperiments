

void setup()
  {
 size(900, 700);
  background(0);
  smooth();
  }
 
 
 
void draw()
  {
  for (int i=1; i < random(1000, 7000); i = i+15000)
  {
  stroke(random(250), random(40), 3, random(100, 255));
  strokeWeight(random(60, 70));
  point(mouseX+random(10), mouseY-random(10));
  filter(BLUR, 0.6);
  }
  }


