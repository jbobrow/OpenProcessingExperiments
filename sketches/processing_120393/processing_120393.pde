
//Spring
//Spring is a season of love and birth! The rotating spiral sphere is a symbol of time.
//The waving lines can be seen as the waving grass in nature, or the waving hair on skin.
//The changing size and color of the spheres make the feeling of growing.
//Su Hsiu Pai
//suhsiupai@gmail.com


int radius = 400;
float xstart, xnoise, ystart, ynoise;
void setup() {
  size(800, 450, P3D);
  background(200, 90, 90);
  sphereDetail(8);
  noStroke();
  xstart=random(10);
  ystart=random(10);
  frameRate(18);
}


void draw() {
  background(200, 90, 90);
  xstart += 0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;

  for (int y= 0; y <= height; y+=70) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x =-400; x<=1500;x+=90) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
      drawPoint01(x, y, noise(xnoise, ynoise));
    }
  }

  drawSSphere();
}


void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, 400-y, -y);
  float sphereSize = noiseFactor*35;
  float grey = 150+(noiseFactor*120);
  float alph = 15+(noiseFactor*120);
  noStroke();
  fill(grey, alph);

  sphere(sphereSize);


  popMatrix();
} 

void drawPoint01(float x, float y, float noiseFactor) {
  fill(150+2*y, 150+x, 200, 170);
  ellipse(x, y, 6, 6);
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  stroke(0.5*x, 0, 0, 50);
  strokeWeight(1);
  line(0, 0, 80, 0);
  popMatrix();
}

void drawSSphere() {
  //background(255);
  translate(width/2, height/2, 0);
  rotateY(frameCount*0.01);
  rotateX(frameCount*0.04);
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0; 
  float lastz = 0;
  while (t<180) {
    s += 16;
    t += 1;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 +(radius*cos(radianS)*sin(radianT));
    float thisy =0 +(radius*sin(radianS)*sin(radianT));
    float thisz= 0 +(radius*cos(radianT));
    if (lastx != 0 ) {
      strokeWeight(0.4);
      stroke(255, 160);
      line(thisx, thisy, thisz, lastx, lasty, lastz);

      noStroke();
      fill(255);
      ellipse(lastx, lasty, 5, 5);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}



