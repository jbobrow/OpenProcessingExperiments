
//nested loops; French fries
//TCY
float xstart=random(10);
float xnoise=xstart;
float ynoise=random(10);
int radius = 100;
void setup() {
  size(600, 600, P3D);
  frameRate(50);
}

void draw() {
  //background(255);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.03);
  rotateX(frameCount * 0.04);
  for (int y=0; y<=height;y +=5) {
    ynoise+=0.1;
    xnoise=xstart;
    for (int x=0;x<=width; x += 5 ) {
      xnoise+=0.1;
      drawpoint(x, y, noise(xnoise, ynoise));
    }
  }
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  while (t < 180) {
    s += 18;
    t += 1;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius*cos(radianS)*sin(radianT));
    float thisy = 0 + (radius*sin(radianS)*sin(radianT));
    float thisz = 0 + (radius*cos(radianT));
    if (lastx != 0) {
      stroke(255,10);
      strokeWeight(2*noise(xnoise, ynoise));
      line(thisx, thisy, thisz, lastx, lasty, lastz);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}


void drawpoint(float x, float y, float noisefactor) {
  int alph=int(noisefactor*255);
  stroke(0, alph);
  strokeWeight(0.1);
  //noStroke();
  float len=10*noisefactor;
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(noisefactor*radians(540));
  //ellipse(x, y, 5, 5); 
  fill(255, 244, 60, 10);
  rect (x, y, len*noise(noisefactor)*10, len*noisefactor);
  popMatrix();
}

void keyPressed() {
  saveFrame("TCY####.png");
}



