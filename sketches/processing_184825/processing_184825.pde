
void setup() {
  size(400, 400);
  noFill();
  smooth(8);
  //colorMode(HSB, 100);
}

float a;

void draw() {
  background(#171717);
  //stroke(#059cdd);
  recursiveFunction(width/2*sin(a), 280*sin(a), 12);
  a = a + 0.03;
}

void recursiveFunction(float x, float radius, int level) {
  float tt = 126 * level/4.0;
  stroke(tt);
  ellipse(x, height/2, radius, radius);
  
  if(level > 1) {
    level = level - 1;
    recursiveFunction(x + radius*5, level*20, level);
    recursiveFunction(x - radius*5, level*20, level);
  }
}
