
void setup() {
  size(600, 500);
  background(0);
  smooth();
  noStroke();
}

int i = 0;

void draw() {
  fill(0, 15-(i%180)/12);
  rect(0, 0, width, height);
  fill(90+sqrt(pow(i%20-10,2)),30,20);
//fill(100, 30, 20);
  translate(width/2, height/2);
  rotate(radians(i++));
  for (int t=0; t < 360*9; t++) {
    float x = 0.2*t*sin(radians(t));
    float y = 0.1*t*cos(radians(t));
    ellipse(x, y, 2*t/360, 2*t/360);
  }
}

