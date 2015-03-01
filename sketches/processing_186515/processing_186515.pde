
float clicks;

void setup() {
  size(1000, 1300);
  noStroke();
  fill(400, 600, 0, 700);
}

void draw() {
colorMode(HSB)
  background(10);
  translate(width/2, height/6);
  for (int q = 0; q < 9; q++) {
    float s = q*10;
    beginShape();
    for (int i = 0; i <= 360; i++) {
      float angle = (s+s/9)-abs(cos(radians(i*1.9-frameCount))) * abs(cos(radians(i*1.5+frameCount)) * s);
      float x = sin(radians(i+frameCount)) * (angle);
      float y = cos(radians(i+frameCount)) * (angle);
      vertex(x, y);
    }
    endShape();
  }
}

void mousePressed() {
  clicks++;
}



