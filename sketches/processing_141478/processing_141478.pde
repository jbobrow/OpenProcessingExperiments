
import processing.video.*;
Capture cam;
int nbolas = 3000;
float[] x = new float[nbolas];
float[] y = new float[nbolas];
float[] t = new float[nbolas];
void setup() {
  size(640, 480);
  cam = new Capture(this, Capture.list()[0]);
  cam.start(); 
  for (int i = 0; i < nbolas ; i++) {
    x[i] = random(width);
    y[i] = random(height);
    t[i] = random(2, 50);
  }
}
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  //background(255);
  
 for (int i = 0; i < nbolas ; i++) {
   color c = cam.get(int(x[i]), int(y[i]));
  float brillo = brightness(c)/10;
   t[i]=brillo;
    if (t[i]>10) {
      fill(255);
    }
    else {
      fill(0);
    }
    ellipse(x[i], y[i], t[i], t[i]);
    y[i]++;
    if (y[i]>height) {
      y[i] = 0;
    }
  }
  ////// aca
}
