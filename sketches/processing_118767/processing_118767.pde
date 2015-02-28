
float c = 0;
float d = 5;
float e = 5;

void setup() {
  background(239,234,300);
  colorMode(HSB, 100);
  size(700, 700);
  smooth();
  strokeWeight(7);
}

void draw() {
  stroke(c, 170, 100, 20);

  
  float x2 = map(sin(d), -20, 25, 3, width - 50);
  float y2 = map(cos(d), -20, 25, 3, height - 50);
  
  float x3 = map(sin(e), -30, 15, 3, width - 100);
  float y3 = map(cos(e), -30, 15, 3, height - 100);
  
  line(mouseX, mouseY, y3, x3);
  
  d = d + 0.07;
  e = e + 0.05;
  
  c = c + 10;
  if (c > 100) {
    c = 0;
  }
}


