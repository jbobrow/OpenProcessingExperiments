
/*
spring - the season of cherry blossom
the branches swing by the wind
the insects fly around the flowers

move your mouse to act like the fly's rails
by KokFu Lok
 */

int radius = 100;
float xstart, xnoise, ystart, ynoise;
void setup() {
  size(500, 500, P3D);
  background(255);
  // frameRate(24);
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  background(104,160,8,5);
 
  pushMatrix();
  rotateZ(second()*0.001);
  rotateY(noise(mouseX)*0.001);
  // rotateZ(frameRate*.035);
  translate(0, -1.5*height, 0);
  xstart += 0.2;
  ystart += 0.6;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= width*4; y+=5) {
    ynoise -= 0.1;
    xnoise = xstart;
    for (int x = 0; x <= height*2.5; x+=10) {
      xnoise += 10.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  popMatrix();
   butterfly(mouseX+random(50), mouseY+random(50));
  butterfly(pmouseX-random(50), pmouseY-random(50));
  butterfly(pmouseX+50, pmouseY+50);
  butterfly(mouseX-50, mouseY-50);
  butterfly(pmouseX-100, pmouseY+100);
 // butterfly(mouseX, mouseY);
}

void butterfly(float x, float y) {
  pushMatrix();
  float radius = width/4-x/2;
  translate(x, y, 0);
  rotateY(frameCount * 0.01);
  rotateX(frameCount * 0.5);
  //stroke(0);
  stroke(random(200, 255), random(200, 255), 0, y/height*50+50);
  strokeWeight(random(3));
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  while (t < 180) {
    s += 18;
    t += 1;
    //radius+=t*0.01;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius*random(2)*cos(radianS)*sin(radianT));
    float thisy = 0 + (radius*sin(radianS)*sin(radianT));
    float thisz = 0 + (radius*cos(radianT));
    if (lastx != 0) {
      line(thisx, thisy, thisz, lastx, lasty, lastz);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
  popMatrix();
}


void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y, -x);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  float blue = 220 + (noiseFactor * 120);
  float alph = 80 + (noiseFactor * 20);
  noStroke();
  fill(252, 212, blue, alph);
  ellipse(0, 0, edgeSize+random(20), edgeSize/2);
  popMatrix();
}



