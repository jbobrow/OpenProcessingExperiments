
import processing.video.*;
Capture cam;
float[] x = new float[2000];
float[] y = new float[2000];
float[] t = new float[2000];

void setup() {
  size(640, 480);
  for(int i=0; i<2000; i++){
  x[i]= random(width);
  y[i]=random(height);
  t[i]= random(2,10);
}
    cam = new Capture(this, Capture.list()[0]);
    cam.start();     
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  color c = cam.get (200,200);
  float brillo= brightness (c);
  if(brillo<50){
    ellipse(200,200,200,200);
}
}

