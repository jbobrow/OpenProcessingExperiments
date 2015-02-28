
void setup() {
  
  size(600,400);
  background(180,180,180);
  stroke(0,0,230);
  strokeWeight(10);
  frameRate(20);
  
}

void draw() {
  
 

  
 float a = 0.0;
float inc = TWO_PI/50;
for (int i=0; i<600; i++) {
  point(i, 200+cos(a)*40.0);
  a = a + inc;
  
}
  
}

