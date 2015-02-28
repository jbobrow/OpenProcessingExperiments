
void setup() 
  {
 size(500, 500);
  background(0);
  smooth();
  }



void draw()
  {
  for (int i=1; i < random(1000, 7000); i = i+15000) 
  {
  stroke(random(255), random(255), 0, random(100, 255));
  strokeWeight(random(40, 80));
  point(mouseX+random(70), mouseY-random(70));
  filter(BLUR, 0.7);
  }
  }
  



