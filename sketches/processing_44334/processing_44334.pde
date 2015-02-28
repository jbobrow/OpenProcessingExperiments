
//  R.A. Robertson 2009.04 - 2011.10 "Perlin Drip" ~ www.rariora.org ~
float x, xoff = 0.0;
float y, yoff = 0.0;
float s, t;
boolean toggleLoop = true;

void setup() {
  size(600, 400);
  background(15, 0, 20);
  smooth();
  x = 50;
  y = 30;
  s = 0;
  t = 0;
}

void draw() {
  fill(t*3, t*2, s, s * 0.25);
  noStroke();
  ellipse (x, y, s, t);
  s = noise(xoff)*60;
  xoff += 0.05;
  y = y + 2;
  t = noise(yoff)*60;
  yoff += 0.04;
  if (y >= height) {
    y = 30;
    x = x + 50;
  }
  if (x >= width) {
    x = random(120);
  }
}

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
 if (mouseButton == RIGHT) {
 setup();
 } 
}
                
