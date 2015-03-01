
void setup() {
  size(640, 640);
  stroke(255);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=6) {
    for (int q = 0; q < 360; q+=180) {
      float x = map(sin(radians(q+i+frameCount))*i, -mouseX, mouseY, i, -i);
      float y = map(cos(radians(q+i+frameCount))*i, -mouseX, mouseY, -i, i);
      
      float x2 = map(sin(radians(q+i+6+frameCount))*(i+6), -mouseX, mouseY, i+6, -(i+6));
      float y2 = map(cos(radians(q+i+6+frameCount))*(i+6), -mouseX, mouseY, -(i+6), i+6);
      line(x, y, x2, y2);
      line(-x, -y, -x2, -y2);
      
      line(y, x, y2, x2);
      line(-y, -x, -y2, -x2);
      
      line(x, -y, x2, -y2);
      line(-x, y, -x2, y2);
      
      line(y, -x, y2, -x2);
      line(-y, x, -y2, x2);
    }
  }
}



