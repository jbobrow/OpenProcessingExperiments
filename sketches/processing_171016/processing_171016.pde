
int counter, frames=180;
float xc1, yc1, xc2, yc2, xc3, yc3;
float theta;

void setup() {
  size(500, 500);
}

void draw() {
  background(#4156BC);
  stroke(255);
  strokeWeight(40);
  fill(255, 150);
  float t = map(sin(theta), -1, 1, 1, -1.3);
  float d = width/3;
  curveTightness(t);
  beginShape();
  counter = 0;
  for (int angle = 0; angle < 360; angle +=  60) {
    float xc = cos(radians(angle)) * d + width/2;
    float yc = sin(radians(angle)) * d + height/2;
    curveVertex(xc, yc);
    switch(counter) {
    case 0:
      xc1 = xc;
      yc1 = yc;
      break;
    case 1:
      xc2 = xc;
      yc2 = yc;
      break;
    case 2:
      xc3 = xc;
      yc3 = yc;
      break;
    }
    counter++;
  }
  curveVertex(xc1, yc1);
  curveVertex(xc2, yc2);
  curveVertex(xc3, yc3);
  endShape();

  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

