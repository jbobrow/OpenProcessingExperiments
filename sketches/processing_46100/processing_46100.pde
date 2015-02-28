
//Author: Herbert Hsu
//Purpose: Create an kinetic artwork that expresses feeling of the spring season
//Concept: surrounded by colors
//Reference: Abandoned Artwork#49, examples from Matt Pearson "Generative Art"p.87

float xstart, xnoise, ystart, ynoise, xstartNoise, ystartNoise;

void setup() {
  size(600, 500, P3D);
  smooth();
  background(196, 240, 145);
  frameRate(20);
  xstartNoise=random(20);
  ystartNoise=random(20);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
}
void draw() {
  float r=196;
  float g=240;
  float b=145;
  background(r, g, b);

  xstartNoise+=0.01;
  ystartNoise+=0.01;
  xstart+=(noise(xstartNoise)*0.5)-0.25;
  ystart+=(noise(ystartNoise)*0.5)-0.25;

  xnoise=xstart;
  ynoise=ystart;
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.2;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.2;
      drawPoint(x, y, noise(xnoise, ynoise));
      rotateY(frameCount * 0.08);
      rotateX(frameCount * 0.01);
      rotateZ(frameCount * 0.008);
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {

  pushMatrix();
  translate(x, y, -100);
  // if (k>=99){ k=k-0.001*noise(xnoise,ynoise);}
  // if(k<=-100){ k=k+0.002*noise(xnoise,ynoise);}
  //  k=k-0.001*noise(xnoise,ynoise);

  //rotateY(frameCount * 0.08);
  //rotateX(frameCount * 0.01);
  //rotateZ(frameCount * 0.008);
  rotate(noiseFactor * radians(55)+200);
  strokeWeight(3);
  stroke(random(200)+50, random(200)+50, random(200)+50, 30);
  line(0, 0, 20, 0);
  popMatrix();
}

void keyPressed() { 
  saveFrame("spring.jpg");
} 


