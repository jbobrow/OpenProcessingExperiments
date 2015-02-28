
float r = 0;
float centerX;
float centerY;
float dir = 1;

void setup() {
  size(180, 140);
  centerX = width / 2;
  centerY = height / 2;
}

void draw() {
  background(random(150, 170)); 
  
  for(int i = 0; i < 200; i++) {
    stroke(170);
    int h = (int)random(height);
    line(0, h, width, h);
  }
  
  fill(#995555, 140);
  stroke(0, 0);
  for(float i = 0; i < 2 * PI; i += 0.8) {
    arc(centerX, centerY, 500, 500, r + i, r + i + PI / 8 + sin(r) * 0.1);
  }
  r += 0.1 * dir;
}

void mousePressed() {
  centerX = mouseX;
  centerY = mouseY;
  dir = -dir;
}

