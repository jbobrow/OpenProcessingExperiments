

float y = 0.0;
float lineColor = 255;


void setup() {
  size(400,400);
  smooth();
  //background(152,206,187);
  //stroke(255);
}

void draw() {
  background(152,206,187);
  stroke(lineColor);
  y += 1.0;
  for (int i = 0; i <= height; i += 10) {
  //for (float i = 1000; i > 100; i /= 1.2) {
  line(0,y+i,width,y+i);
  }
  if ((y+90) > 100) {
  //if (y > height) {
    y = 0;
  }
}

void mousePressed() {
  lineColor = random(200,255);
  for (int x = 0; x <= width; x += 10) {
    line (x, 0, x, height);
  }
}


