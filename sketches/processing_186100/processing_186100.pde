
void setup() {
  size(640, 640);
  stroke(0, 255, 125);
  fill(0, 255, 125, 125);
}

void draw() {
  background(40);
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=12) {
    float angle = sin(radians(i*3+frameCount*3))*50;
    float x1 = sin(radians(i+6));
    float y1 = cos(radians(i+6));
    float x2 = sin(radians(i-6));
    float y2 = cos(radians(i-6));
    float r1 = 20;
    float r2 = 150-angle;
    beginShape();
    vertex(r1*x1, r1*y1);
    vertex(r2*x1, r2*y1);
    vertex(r2*x2, r2*y2);
    vertex(r1*x2, r1*y2);
    endShape(CLOSE);
  }
}



