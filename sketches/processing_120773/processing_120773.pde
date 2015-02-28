
//Spring
//Clark Li
//In this practice, I tried to make a grassland more like real in 3D.
//And combined 2D moving to make the cloud image.

float xstart, ystart, xnoise, ynoise;
PImage a;
void setup() {

  //size(displayWidth,displayHeight,P3D);
  size(700, 600, P3D);
  frameRate(350);
  xstart=random(1);
  xstart=random(1);
  a=loadImage("tree.png");
}

void draw() {
  background(228, 215, 100, 50);
  xstart+=0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;

  noStroke();
  fill(161, 228, 236);
  rect(0, 0, 700, 220);

  for (int y = 0; y <= 222; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width*1.5; x+=5) {
      xnoise +=0.1;
      drawPoint2(x, y, noise(xnoise, ynoise));
    }
  }

 image(a, 280, 120, 150, 113);

  for (int y = -100; y <=height/2 ; y+=5) {
    ynoise +=0.1;
    xnoise = xstart;
    for (int x = -240; x <= width*2; x+=3) {
      xnoise += 0.08;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x-250, 500-y, -y/2*3);
  rotate(noiseFactor * radians(-120));
  stroke(random(30), 150, random(30), 180);
  strokeWeight(1.5);
  line(65, 0, 0, 0);
  popMatrix();
}

void drawPoint2(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  float grey = 200+(noiseFactor * 150);
  float alph = 200 + (noiseFactor * 135);
  noStroke();
  fill(grey, alph, 200);
  ellipse(0, 0, edgeSize*1.5, edgeSize);
  popMatrix();
}




