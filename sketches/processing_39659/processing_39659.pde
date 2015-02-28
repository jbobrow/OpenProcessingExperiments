
import processing.video.*;
Capture myCapture;
float boxSize = 10;
color pix;

void setup() {
  size(400, 400, P3D);
  myCapture = new Capture(this, width, height, 30);
}
void captureEvent(Capture myCapture) {
  myCapture.read();
}
void draw() {
  background(255);

  translate(30, 30);
  //rotateX(frameCount * angleInc);
  rotateY(0.5);
  rotateZ(-0.2);

  for (int i = 0; i <= width; i += boxSize) {
    pushMatrix();
    for (int j = 0; j <= height; j += boxSize) {
      pix = myCapture.get(i, j);
      pushMatrix();
      translate(i, j);
      noStroke();
      //smooth();
      fill(pix, 255);
      box(boxSize, boxSize, int(pix/100000));
      popMatrix();
    }
    popMatrix();
  }
}
                
