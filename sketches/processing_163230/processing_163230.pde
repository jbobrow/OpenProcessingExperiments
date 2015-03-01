
float a = 0;

void setup() {
  size (360, 360);
  colorMode(HSB,360);
}

void draw() {
  background(0);
  stroke(80);
  line(0, height/2, width, height/2);
  for (float i = 0+a; i < 360+a; i++) {
   stroke(i, 255, 360); 
   point(i, height/2+sin(radians(i*2))*50);
  }
  if (a > width) {
    a = -360;
  }
  a+=map(mouseX, 0, width, 0, 10);
}

