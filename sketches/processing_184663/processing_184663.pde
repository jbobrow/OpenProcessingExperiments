
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
    float x = sin(radians(i))*20;
    float y = cos(radians(i))*20;
    float x2 = sin(radians(i+6))*(150-angle);
    float y2 = cos(radians(i+6))*(150-angle);
    float x3 = sin(radians(i-6))*(150-angle);
    float y3 = cos(radians(i-6))*(150-angle);
    beginShape();
    vertex(x, y);
    vertex(x2, y2);
    vertex(x3, y3);
    endShape(CLOSE);
  }
}



