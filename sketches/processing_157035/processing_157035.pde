
float num = 0;

void setup() {
  size(640, 640);
  stroke(255);
  noFill();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=6) {
    for (int q = 0; q < 360; q+=180) {
      float x = map(sin(radians(q+i+frameCount))*i, -mouseX, mouseY, i, 0);
      float y = map(cos(radians(q+i+frameCount))*i, -mouseX, mouseY, 0, i);
      ellipse(x, y, 2, 2);
      ellipse(y, x, 2, 2);
      ellipse(-x, -y, 2, 2);
      ellipse(-y, -x, 2, 2);
      
      float x2 = map(sin(radians(q+i+frameCount))*i, -mouseX, mouseY, -i, 0);
      float y2 = map(cos(radians(q+i+frameCount))*i, -mouseX, mouseY, 0, i);
      ellipse(x2, y2, 2, 2);
      ellipse(y2, x2, 2, 2);
      ellipse(-x2, -y2, 2, 2);
      ellipse(-y2, -x2, 2, 2);
    }
  }
  num += 0.01;
}



