
float x;
float y;
float x1;
float y1;
float multiStroke;

void setup() {
  size(1280,800);
  background(255);
  smooth();
}

void draw() {
  stroke(multiStroke,multiStroke,multiStroke,x);
  line(x,y,x1,y1);
  
  multiStroke = random(255);
  x = random(1280);
  y = random(1280);
  x1 = random(1280);
  y1 = random(1280);
}

