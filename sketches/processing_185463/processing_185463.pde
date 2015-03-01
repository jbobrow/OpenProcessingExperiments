
void setup() {
size(1000, 500);
background(179, 79, 226);
}

void draw() {
  drawCircles(500, 250, 100, 200);
  drawCircles(200, 400, 60, 40);
  drawCircles(800, 100, 100, 50);      
}

void drawCircles(float a, float b, float c, float d) {
  for (int i = 0; i < 20; i = i+1) {
    ellipse(a, b, c, d);
    fill(random(255), random(255), random(255));
  }
}




