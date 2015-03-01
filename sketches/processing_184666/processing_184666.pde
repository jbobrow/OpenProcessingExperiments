
void setup() {
  size(640, 640);
  strokeWeight(10);
  stroke(255, 0, 125, 125);
}

void draw() {
  background(40);
  translate(width/2, height/2);
  for (int i = -180; i < 180; i+=3) {
    float angle = sin(radians(-sin(radians(i*map(mouseX, 0, width, 0, 5)))*i+frameCount*2))*50;
    float x = sin(radians(i))*(50-angle/3);
    float y = cos(radians(i))*(50-angle/3);
    float x2 = sin(radians(i))*(150-angle);
    float y2 = cos(radians(i))*(150-angle);
    line(x, y, x2, y2);
  }
}


