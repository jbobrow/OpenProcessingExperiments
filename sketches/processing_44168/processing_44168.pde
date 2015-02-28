
// "Fireflies" w/Pseudo Flocking (Perlin) R.A. Robertson, April 2009

int flynum = 23;
float x = 0;
float y = 0;
float z = .01;
float n;
float xlate;
float xoff = 0;
float yoff = 0;
float zoff = 0;
float xinc = 0.004;
float yinc = 0.003;
float zinc = 0.006;
Firefly [] ffarray = new Firefly [flynum];
boolean toggleLoop = true;

void setup() {
  size (800, 400);
  background(0);
  smooth ();
  frameRate (24);
  for (int i = 0; i < flynum; i++) {
    ffarray[i] = new Firefly();
  }
}

void draw() {
  fill(0, 0, 40, 9);
  rect(0, 0, width, height);
  pushMatrix();
  translate(-300, -100); // Compensates for centering. Not sure why needed.
  translate(x, y); // Pseudo flocking 2D.
  x = noise(xoff)*width;
  xoff += xinc;
  y = noise(yoff)*height;
  yoff += yinc;
  translate(width*xlate, height*xlate); // See ScalarCenterDraw study.
  scale(z);        // Psuedo z depth. Optional, but fun.*
  z = noise(zoff)*1.5;
  zoff += zinc;
  n = 1 - z;  // See ScalarCenterDraw study.
  xlate = n/2;  // See ScalarCenterDraw study.
  for (int i = 0; i < flynum; i++) {
    ffarray[i].fly();
    ffarray[i].shine();
  }
  popMatrix();
  fill(200,225,255,random(200,255));
  ellipse(random(width),random(height*.6),1,1);
}

// Controls

// Mouse toggle code by amnon.owed
// http://forum.processing.org/topic/mouse-toggle-loop

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop(); 
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
}

// Class

class Firefly {
  float x, xoff = random(width);
  float y, yoff = random(height);
  float xinc = random(0.003, 0.006);
  float yinc = random(0.003, 0.006);
  float angle = random(0.0,2*PI);
  float freq = random(0.05, 0.2);
  float amp, a;
  float s = random(1, 3);

  Firefly () {
  }

  void fly() {
    x = noise(xoff)*width;  // Scaled down for tighter grouping.
    xoff += xinc;
    y = noise(yoff)*height;
    yoff += yinc;
  }
  
  void shine() {
    angle = angle + freq;
    amp = 200;
    a = (sin(angle + (2*PI)) * amp); 
    fill(60, 110, 0, a); // Set alpha to "a" for blink.
    //fill(random(50, 230), random( 50, 255), 0, a); // Chromatic Fireflies
    noStroke();
    ellipse (x, y, s, s);
  }
}


