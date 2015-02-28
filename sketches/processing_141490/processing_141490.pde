
import processing.video.*;
Capture cam;
int nbolas = 2200;
float[] x = new float[nbolas];
float[] y = new float[nbolas];
float[] t = new float[nbolas];
void setup() {
  size(1280,720);
    cam = new Capture(this, Capture.list()[0]);
    cam.start();
for(int i = 0;i < nbolas ; i++) { 
x[i] = random (width);
y[i] = random (height);
t[i] = random (2,50);
}
   
}
 
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  // image(cam, 0, 0);
background(51,0,102);
   
 for (int i = 0; i < nbolas ; i++) {
   color c = cam.get(int(x[i]), int(y[i]));
  float brillo = brightness(c)/10;
   t[i]=brillo;
    if (t[i]>10) {
      fill(random(255));
      //tint(0, 153, 204, 126);
      stroke(random(0,4)*51,random(0,4)*51, random(4,6)*51);
      strokeWeight(random(1,12));
    }
    else {
      fill(255, random(0,2)*51, random(0,2)*51);
      stroke(255, random(2,4)*51,0);
      strokeWeight(random(0,3));
    }
    ellipse(x[i], y[i], t[i], t[i]);
    y[i]++;
    if (y[i]>height) {
      y[i] = 0;
    }
  }
}
