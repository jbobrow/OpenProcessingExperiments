
float num, pathR, pathG, pathB;
int backgroundColor = 0;
boolean doOnce = true;

void setup() {
  size(640, 640);
}

void draw() {
  background(backgroundColor);
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=10) {
    float x = sin(radians(i)) * 80;
    float y = cos(radians(i)) * 80;

    float x2 = sin(radians(i)) * 150;
    float y2 = cos(radians(i)) * 150;

    pathR = (((float)255/width)*mouseX)+125*sin(i+num*3);
    pathG = (50)+125*sin(i+num*3);
    pathB = (((float)255/height)*mouseY)+125*sin(i+num*3);

    stroke(pathR, pathG, pathB);
    fill(pathR, pathG, pathB);

    pushMatrix();
    translate(x, y);
    rotate(radians(-i+frameCount));

    line(x, y, x2, y2);
    line(-x, -y, -x2, -y2);
    line(y, -x, y2, -x2);
    line(-y, x, -y2, x2);

    ellipse(x, y, 5, 5);
    ellipse(-x, -y, 5, 5);
    ellipse(-y, x, 15, 15);
    ellipse(y, -x, 15, 15);
    popMatrix();
  }
  num += 0.001;
}
void mousePressed() {
  if (doOnce && backgroundColor == 255) {
    backgroundColor = 0;
    doOnce = false;
  }
  if (doOnce && backgroundColor == 0) {
    backgroundColor = 255;
    doOnce = false;
  }
}

void mouseReleased() {
  doOnce = true;
}



