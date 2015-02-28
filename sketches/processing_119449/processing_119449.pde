
//Wave
//Clark Li
//This is the a 3D test of processing. I thy to make the wave looked more Naturally.
//It can change the wave when you press the mouse whith X.
float xstart, ystart, xnoise, ynoise;
void setup() {
  size(600, 600, P3D);
  frameRate(350);
  sphereDetail(3);
  xstart = random(10);
  ystart = random(30);
}
void draw() {
  background(0);
  xstart+=0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;

  if (mousePressed) {
    for (int y = 0; y <= height; y+=20) {
      ynoise += 0.1;
      xnoise = xstart;
      for (int x = 0; x <= width; x+=20) {
        xnoise += 0.1;
        drawPoint(x, y, noise(xnoise/mouseX, ynoise));
      }
    }
  }
  else {
    for (int y = 0; y <= height; y+=20) {
      ynoise += 0.1;
      xnoise = xstart;
      for (int x = 0; x <= width; x+=20) {
        xnoise += 0.1;
        drawPoint(x, y, noise(xnoise, ynoise));
      }
    }
  }
}

    void drawPoint(float x, float y, float noiseFactor) {
      pushMatrix();
      translate(x, 500-y, -y);
      float sphereSize=noiseFactor*50;
      //float grey = 150 + (noiseFactor*200);
      float alph = 150 + (noiseFactor*120);
      stroke(43, 72, 150, 50);
      fill(43, 72, 207, 50);
      //fill(noiseFactor*grey, random(alph)*3);
      sphere(sphereSize);
      popMatrix();
    }



