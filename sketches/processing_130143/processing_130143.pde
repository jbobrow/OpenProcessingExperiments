

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  //noCursor();
  //colorMode(HSB);
  //rectMode(CENTER);
  n = (long)random(1000);
  frameRate(50);
}

float xn, yn, zn;
float xstart;
long n;

void draw() {

  xn = noise(n);
  yn = noise(n);
 
  float r = 10;
  int centX = mouseX;
  int centY = mouseY;
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float radiusNoise = random(100);
 background(centX,centY, (centX+centY)/2);
 beginShape();
  fill(centX/2,centY/2, (centX+centY)/4, random(255));
  stroke(centY/2,centX/2, (centX+centY)/2, random(255));
  for (float ang = 0;ang<1080; ang+= 0.7) {
    radiusNoise +=0.05;
    r += 0.05;

    float thisRadius = r +(noise(radiusNoise)*100);
    float rad = radians(ang);
    x = centX + (thisRadius*cos(rad));
    y = centY + (thisRadius*sin(rad));

    if (lastx>-999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}



